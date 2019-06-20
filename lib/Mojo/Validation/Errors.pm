package Mojo::Validation::Errors;
use Mojo::Base -base;

has 'info' => sub { {} };

=head2 all

Get all the errors for a field

=cut

sub all {
    my ($self, $field) = @_;

    return $self->info->{ $field } || [];
}

=head2 first

Get first error for a field

=cut

sub first {
    my ($self, $field) = @_;
    my $errors = $self->info->{ $field } || [];

    return $errors->[ 0 ] || '';
}

=head2 for

Check is there are errors for a field

=cut

sub for {
    my ($self, $field) = @_;

    return defined($self->info->{ $field }) ? 1 : 0;
}

=head2 push

Push a new error for a field

=cut

sub push {
    my ($self, $field, $error) = @_;

    my $errors = $self->info->{ $field } || [];
    push(@$errors, $error);

    $self->info->{ $field } = $errors;

    return $self;
}

1;
