package Mojo::Validation::Rules::RequiredIfDefined;
use Mojo::Base "Mojo::Validation::Rule";

use List::Util qw(any);

has 'error' => 'Field is required when %s is defined';
has 'name' => 'required_if_defined';

=head2 check

Check if value of the field is defined only if one of the @inputs are defined

=cut

sub check {
    my ($self, $field, @inputs) = @_;

    my $defined = any { defined($self->value($_)) } @inputs;

    if ($defined && !$self->value($field)) {
        return $self->message($field, @inputs);
    }
}

1;
