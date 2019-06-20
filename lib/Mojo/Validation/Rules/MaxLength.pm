package Mojo::Validation::Rules::MaxLength;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should contain maximum %s characters';
has 'name' => 'max_length';

=head2 check

Check if field contains $length characters

=cut

sub check {
    my ($self, $field, $value, $length) = @_;

    if (length($value) > $length) {
        return $self->message($field, $length);
    }
}

1;
