package Mojo::Validation::Rules::RequiredIfIsEqual;
use Mojo::Base "Mojo::Validation::Rule";

use List::Util qw(any);

has 'error' => 'Field is required when %s is equal %s';
has 'name' => 'required_if_is_equal';

=head2 check

Check if value of the field is defined only if $input value is $value

=cut

sub check {
    my ($self, $field, $input, $value) = @_;

    my $target = $self->value($input) // '';

    if ($target eq $value && !$self->value($field)) {
        return $self->message($field, $input, $value);
    }
}

1;
