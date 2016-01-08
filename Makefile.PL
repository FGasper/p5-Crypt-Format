
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Crypt::Format',
    VERSION_FROM => 'lib/Crypt/Format.pm',                                # finds \$VERSION
    AUTHOR       => 'Felipe Gasper ()',
    ABSTRACT     => 'Conversion utilities for encryption applications',
    PREREQ_PM    => {
        'MIME::Base64' => 0.01,
        'Test::Simple' => 0.44,
    },
);
