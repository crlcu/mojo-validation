package Mojo::Validation::Rules::Datetime;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field is not a valid datetime';
has 'name' => 'datetime';

=head2 check

Check if value of the field is a datetime

=cut

sub check {
    my ($self, $field, $value) = @_;

    my $regex = '^(\d{4})-((0[1-9])|(1[0-2]))-(0[1-9]|[12][0-9]|3[01]) ((0[0-9])|(1[0-9])|(2[0-4])):((0[0-9])|([1-5][0-9])):((0[0-9])|([1-5][0-9]))$';

    if (!($value =~ m/$regex/)) {
        return $self->message($field);
    }
}

1;
