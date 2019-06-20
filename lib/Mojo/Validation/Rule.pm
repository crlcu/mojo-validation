package Mojo::Validation::Rule;
use Mojo::Base -base;

has [qw(input output)] => sub { {} };
has 'error' => 'Field is not valid';
has 'name' => 'rule';

=head2 check

Check if the field value is valid

=cut

sub check {
    my ($self, $field, @args) = @_;

    die "Implement in subclass";
}

=head2 extract

Extract value for a field
e.g.: the field might be person.name, in which case we are looking if there is a value in person => { name => 'name' }

=cut

sub extract {
    my ($self, $field, $parts, $params) = (shift, shift, shift, shift);

    if (!scalar(@$parts)) {
        return $params->{ $field };
    }

    return $self->extract(shift @$parts, $parts, $params->{ $field });
}

=head2 message

Get the validation message for a field or return default message

=cut

sub message {
    my ($self, $field, @args) = @_;

    my @parts = split('\.', $field . '.' . $self->name);

    my $message = $self->extract(shift @parts, \@parts, $self->output);

    return sprintf($message || $self->error, @args);
}

=head2 validate

Validate a field

=cut

sub validate {
    my ($self, $field) = (shift, shift);

    return $self->check($field, @_);
}

=head2 value

Get the value for a field

=cut

sub value {
    my ($self, $field) = @_;

    my @parts = split('\.', $field);

    return $self->extract(shift @parts, \@parts, $self->input);
}

1;
