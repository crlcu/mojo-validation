package Mojo::Validation::Rules::File;
use Mojo::Base "Mojo::Validation::Nullable";

use List::Util qw(none);

has 'error' => 'Field should be a valid file';
has 'name' => 'file';

=head2 check

Check if value of the field is file type from @types

=cut

sub check {
    my ($self, $field, $value, @types) = @_;

    if ($value->can('filename') && !$value->filename) {
        return $self->message($field);
    }

    if (none {$value->headers->content_type eq $_} @types) {
        return $self->message($field);
    }
}

1;
