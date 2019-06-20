package Mojo::Validation::Validator;
use Mojo::Base -base;

use Mojo::Loader qw(find_modules load_class);
use Mojo::Validation::Errors;

has [qw(input output)] => sub { {} };

has 'errors' => sub { Mojo::Validation::Errors->new };

has 'failed' => 0;

has 'custom_rules' => sub { [] };

has 'rules' => sub {
    my $self = shift;
    
    my @namespaces = @{ $self->custom_rules };
    push(@namespaces, 'Mojo::Validation::Rules');

    my $rules;

    for my $namespace (@namespaces) {
        for my $module (find_modules($namespace)) {
            my $loaded = _rule($module, 1);

            if (!$loaded) {
                warn "Could not load $module";
                
                next;
            }

            # Initialize rule
            my $rule = $loaded->new(input => $self->input, output => $self->output);

            $rules->{ $rule->name } = $rule;
        }
    }

    return $rules;
};

=head2 check

Check if input is valid

=cut

sub check {
    my ($self, $rules) = @_;

    my @fields = keys(%$rules);

    for my $field (@fields) {
        my $checks = $rules->{ $field } || [];

        if (ref($checks) ne 'ARRAY') {
            $checks = [$checks];
        }

        for my $check (@$checks) {
            my $validatable;
            my $message;

            if (ref($check)) {
                $check->input($self->input);
                $check->output($self->output);

                $validatable = $check;

                $message = $validatable->validate($field);

            } else {
                my ($name, @args) = $self->parse($check);

                $validatable = $self->validatable($name);

                $message = $validatable->validate($field, @args);
            }

            if ($message) {
                $self->failed(1);

                $self->errors->push($field, $message);
            }
        }
    }
}

=head2 parse

Find rule name and args

=cut

sub parse {
    my ($self, $rule) = @_;

    my ($name, $string) = split(':', $rule, 2);
    my @args = split(',', $string || '');

    return($name, @args);
}

=head2 validatable

Find validatable package

=cut

sub validatable {
    my ($self, $rule) = @_;

    return $self->rules->{ $rule } || die "Can't find validation method $rule";
}

=head2 _rule

Load package holding rules

=cut

sub _rule {
    my ($module, $fatal) = @_;

    return $module->isa('Mojo::Validation::Rule') ? $module : undef
        unless my $e = load_class $module;
    $fatal && ref $e ? die $e : return undef;
}

1;
