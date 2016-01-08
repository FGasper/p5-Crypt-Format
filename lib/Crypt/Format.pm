package Crypt::Format;

use strict;
use warnings;

use MIME::Base64 ();

our $VERSION     = '0.01';

=head1 NAME

Crypt::Format - Conversion utilities for encryption applications

=head1 SYNOPSIS

    use Crypt::Format;

    my $der = Crypt::Format::pem2der($pem);

=head1 DESCRIPTION

Not much more to say! This module is for simple conversions that I got
tired of writing out.

=head1 TODO

=over 4

=item * C<der2pem()> is the obvious omission here; it’s tricky, though,
to create for the general case because you’d need to supply the header
and footer, which vary according to what is actually encoded.

=back

=cut

sub pem2der {
    my ($pem) = @_;

    chomp $pem;

    $pem =~ s<.+?[\x0d\x0a]+><>s;
    $pem =~ s<[\x0d\x0a]+[^\x0d\x0a]+?\z><>s;

    return MIME::Base64::decode($pem);
}

=pod

=head1 AUTHOR

    Felipe Gasper
    CPAN ID: FELIPE

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

1;
