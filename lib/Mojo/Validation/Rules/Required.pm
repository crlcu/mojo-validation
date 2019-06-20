package Mojo::Validation::Rules::Required;
use Mojo::Base "Mojo::Validation::Rule";

has 'error' => 'Field is required';
has 'name' => 'required';

=head2 check

Check if value of the field is defined

=cut

sub check {
    my ($self, $field) = @_;

    if (!$self->value($field)) {
        return $self->message($field);
    }
}

1;
