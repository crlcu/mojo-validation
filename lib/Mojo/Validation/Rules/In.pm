package Mojo::Validation::Rules::In;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field has an invalid value';
has 'name' => 'in';

=head2 check

Check if value of the field is in @array

=cut

sub check {
    my ($self, $field, $value, @array) = @_;

    if (!grep($_ eq $value, @array)) {
        return $self->message($field, @array);
    }
}

1;
