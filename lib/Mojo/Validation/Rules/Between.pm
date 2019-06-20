package Mojo::Validation::Rules::Between;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should be between %s and %s';
has 'name' => 'between';

=head2 check

Check if value of the field is between $min and $max

=cut

sub check {
    my ($self, $field, $value, $min, $max) = @_;
    
    if ($value lt $min || $value gt $max) {
        return $self->message($field, $min, $max);
    }
}

1;
