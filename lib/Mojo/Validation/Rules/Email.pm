package Mojo::Validation::Rules::Email;
use Mojo::Base "Mojo::Validation::Nullable";

use Email::Valid;

has 'error' => 'Field should be a valid email';
has 'name' => 'email';

=head2 check

Check if value of the field is an email

=cut

sub check {
    my ($self, $field, $value, $number) = @_;

    if (!Email::Valid->address($value)) {
        return $self->message($field);
    }
}

1;
