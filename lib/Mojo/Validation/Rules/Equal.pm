package Mojo::Validation::Rules::Equal;
use Mojo::Base "Mojo::Validation::Nullable";

use Data::Validate;

has 'error' => 'Field has an invalid value';
has 'name' => 'equal';

=head2 check

Check if value of the field is equal to $target

=cut

sub check {
    my ($self, $field, $value, $target) = @_;

    if (!Data::Validate::is_equal_to($value, $target)) {
        return $self->message($field, $target);
    }
}

1;
