package Mojo::Validation::Rules::RequiredIf;
use Mojo::Base "Mojo::Validation::Rule";

has 'callback' => sub { sub { 0 } };
has 'error' => 'Field is required';
has 'name' => 'required_if';

=head2 check

Check if value of the field is defined only if callback returns true

=cut

sub check {
    my ($self, $field) = @_;

    my $callback = $self->callback;

    if ($self->callback->()) {
        if (!defined($self->value($field))) {
            return $self->message($field);
        }
    }
}

1;
