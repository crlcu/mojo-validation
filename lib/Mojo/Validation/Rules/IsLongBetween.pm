package Mojo::Validation::Rules::IsLongBetween;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should contain between %s and %s characters';
has 'name' => 'is_long_between';

=head2 check

Check if value of the field is between $min and $max

=cut

sub check {
    my ($self, $field, $value, $min, $max) = @_;

    my $length = length($value);

    if ($length < $min || $length > $max) {
        return $self->message($field, $min, $max);
    }
}

1;
