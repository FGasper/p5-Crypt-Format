package Crypt::Format;

use strict;
use warnings;

use MIME::Base64 ();

our $VERSION = '0.051';

=head1 NAME

Crypt::Format - Conversion utilities for encryption applications

=head1 SYNOPSIS

    use Crypt::Format;

    my $der = Crypt::Format::pem2der($pem);
    my $pem = Crypt::Format::der2pem($der, 'CERTIFICATE REQUEST');

    my $good_pem = Crypt::Format::normalize_pem($weird_pem);

=head1 DESCRIPTION

Not much more to say! This module is for simple conversions that I got
tired of writing out.

=cut

sub der2pem {
    my ($der_r, $whatsit) = (\$_[0], $_[1]);

    die "Missing object type!" if !$whatsit;

    my $pem = MIME::Base64::encode($$der_r);
    my $line_sep = substr($pem, -1);

    substr( $pem, 0, 0, "-----BEGIN $whatsit-----$line_sep" );
    substr( $pem, length($pem), 0, "-----END $whatsit-----" );

    return $pem;
}

sub pem2der {
    my ($pem) = @_;

    chomp $pem;

    $pem =~ s<.+?[\x0d\x0a]+><>s;
    $pem =~ s<[\x0d\x0a]+[^\x0d\x0a]+?\z><>s;

    return MIME::Base64::decode($pem);
}

sub normalize_pem {
    my ($pem) = @_;

    $pem =~ m<BEGIN ([^-]+)> or die "Invalid PEM: “$pem”";

    return der2pem( pem2der( $pem ), $1 );
}

=pod

=head1 AUTHOR

Felipe Gasper (FELIPE)

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

1;
