package Mojo::Validation::Rules::BiggerThan;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field value should be bigger than %s';
has 'name' => 'bigger_than';

=head2 check

Check if value of the field is bigger than $number

=cut

sub check {
    my ($self, $field, $value, $number) = @_;

    if ($value <= $number) {
        return $self->message($field, $number);
    }
}

1;
