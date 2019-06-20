package Mojo::Validation::Rules::When;
use Mojo::Base "Mojo::Validation::Nullable";

use List::Util qw(any);

has 'error' => 'Field value should be %s when %s value is %s';
has 'name' => 'when';

=head2 check

Check if value of the field is same as $neede when $input value is $target

=cut

sub check {
    my ($self, $field, $value, $input, $target, $needed) = @_;

    if (($self->value($input) // '') eq $target && $value ne $needed) {
        return $self->message($field, $needed, $input, $target);
    }
}

1;
