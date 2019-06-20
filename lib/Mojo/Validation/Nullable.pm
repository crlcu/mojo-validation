package Mojo::Validation::Nullable;
use Mojo::Base "Mojo::Validation::Rule";

=head2 check

Check if the field value is valid

=cut

sub check {
    my ($self, $field, $value, @args) = @_;

    die "Implement in subclass";
}

=head2 validate

Validate a field only if has a "true" value

=cut

sub validate {
    my ($self, $field) = (shift, shift);
    my $value = $self->value($field);

    if (!$value) {
        return;
    }

    return $self->check($field, $value, @_);
}

1;
