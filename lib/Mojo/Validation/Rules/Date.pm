package Mojo::Validation::Rules::Date;
use Mojo::Base "Mojo::Validation::Nullable";

use DateTime::Format::ISO8601;

has 'error' => 'Field is not a valid date';
has 'name' => 'date';

=head2 check

Check if value of the field is a date

=cut

sub check {
    my ($self, $field, $value) = @_;

    eval {
        my $date = DateTime::Format::ISO8601->parse_datetime($value);
    };

    if ($@) {
        return $self->message($field);
    }
}

1;
