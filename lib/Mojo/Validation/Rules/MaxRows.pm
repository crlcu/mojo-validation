package Mojo::Validation::Rules::MaxRows;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should have maximum %s rows';
has 'name' => 'max_rows';

=head2 check

Check if value of the field is an array with $max rows

=cut

sub check {
    my ($self, $field, $value, $max) = @_;
    
    if (scalar(@$value) > $max) {
        return $self->message($field, $max);
    }
}

1;
