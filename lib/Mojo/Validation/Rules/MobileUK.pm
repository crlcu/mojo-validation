package Mojo::Validation::Rules::MobileUK;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should contain a valid UK mobile number';
has 'name' => 'mobile_uk';

=head2 check

Check if value of the field is avalid UK mobile number

=cut

sub check {
    my ($self, $field, $value) = @_;

    my $regex = '^(?:(?:(?:00\s?|\+)44\s?|0)7(?:[1345789]\d{2}|624)\s?\d{3}\s?\d{3})$';

    if (!($value =~ m/$regex/)) {
        return $self->message($field);
    }
}

1;
