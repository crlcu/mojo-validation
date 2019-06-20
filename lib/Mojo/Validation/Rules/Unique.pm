package Mojo::Validation::Rules::Unique;
use Mojo::Base "Mojo::Validation::Nullable";

use List::Util qw(uniq);

has 'error' => 'Field contains duplicates';
has 'name' => 'unique';

=head2 check

Check if value of the field is an array with unique values

=cut

sub check {
    my ($self, $field, $value) = @_;

    my @unique = uniq @$value;

    if (scalar(@$value) != scalar(@unique)) {
        return $self->message($field);
    }
}

1;
