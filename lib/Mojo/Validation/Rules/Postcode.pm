package Mojo::Validation::Rules::Postcode;
use Mojo::Base "Mojo::Validation::Nullable";

use Geo::Postcode;

has 'error' => 'Field should be a valid postcode';
has 'name' => 'postcode';

=head2 check

Check if value of the field is a valid postcode

=cut

sub check {
    my ($self, $field, $value) = @_;

    if (!Geo::Postcode->new($value)->valid) {
        return $self->message($field);
    }
}

1;
