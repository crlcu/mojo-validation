package Mojo::Validation::Rules::BiggerThanOrEqual;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field value should be at least %s';
has 'name' => 'bigger_than_or_equal';

=head2 check

Check if value of the field is bigger than or equal to $number

=cut

sub check {
    my ($self, $field, $value, $number) = @_;
    
    if ($value < $number) {
        return $self->message($field, $number);
    }
}

1;
