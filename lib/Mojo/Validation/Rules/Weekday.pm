package Mojo::Validation::Rules::Weekday;
use Mojo::Base "Mojo::Validation::Nullable";

use Time::Piece;

has 'error' => 'Field should be a weekday';
has 'name' => 'weekday';

=head2 check

Check if value of the field is a weekday

=cut

sub check {
    my ($self, $field, $value) = @_;
    my $date;

    eval {
        $date = Time::Piece->strptime($value, '%Y-%m-%d');
    };

    if ($@) {
        return $self->message($field);
    }

    if ($date->day_of_week < 0 || 6 < $date->day_of_week) {
        return $self->message($field);
    }
}

1;
