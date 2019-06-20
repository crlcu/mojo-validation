package Mojo::Validation::Rules::Regex;
use Mojo::Base "Mojo::Validation::Nullable";

has 'error' => 'Field should match regex %s';
has 'name' => 'regex';

=head2 check

Check if value of the field match $regex

=cut

sub check {
    my ($self, $field, $value, $regex) = @_;
    
    if (!($value =~ m/$regex/)) {
        return $self->message($field, $regex);
    }
}

1;
