package Mojo::Validation::Rules::WithoutSpaces;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field contains invalid characters';
has 'name' => 'without_spaces';

=head2 check

Check if value of the field is without spaces

=cut

sub check {
    my ($self, $field, $value) = @_;

    if ($value =~ m/\s/) {
        return $self->message($field);
    }
}

1;
