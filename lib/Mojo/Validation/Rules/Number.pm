package Mojo::Validation::Rules::Number;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should contain a valid number';
has 'name' => 'number';

=head2 check

Check if value of the field is a valid number

=cut

sub check {
    my ($self, $field, $value) = @_;

    my $regex = '^-?(?:\d+(?:\.\d*)?|\.\d+)$';

    if (!($value =~ m/$regex/)) {
        return $self->message($field);
    }
}

1;
