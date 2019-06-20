package Mojo::Validation::Rules::Lt;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should contain a value less than %s';
has 'name' => 'lt';

=head2 check

Check if value of the field is less than $target

=cut

sub check {
    my ($self, $field, $value, $target) = @_;

    if (!($value lt $target)) {
        return $self->message($field, $target);
    }
}

1;
