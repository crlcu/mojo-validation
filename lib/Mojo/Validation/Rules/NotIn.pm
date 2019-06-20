package Mojo::Validation::Rules::NotIn;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Invalid value';
has 'name' => 'not_in';

=head2 check

Check if value of the field is not in @array

=cut

sub check {
    my ($self, $field, $value, @array) = @_;

    if (grep($_ eq $value, @array)) {
        return $self->message($field, @array);
    }
}

1;
