package Mojo::Validation::Rules::OnceIn;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field value is present multiple times';
has 'name' => 'once_in';

=head2 check

Check if value of the field is present multiple times in @array

=cut

sub check {
    my ($self, $field, $value, @array) = @_;

    my @found = grep($_ eq $value, @array);

    if (scalar(@found) > 1) {
        return $self->message($field, @array);
    }
}

1;
