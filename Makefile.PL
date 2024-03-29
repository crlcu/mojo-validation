use 5.010001;

use strict;
use warnings FATAL => 'all';

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojo::Validation',
    AUTHOR           => q{Adrian Crisan <adrian.crisan88@gmail.com>},
    VERSION_FROM     => 'lib/Mojo/Validation.pm',
    ABSTRACT_FROM    => 'lib/Mojo/Validation.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Mojolicious' => 0,
        'Test::More' => 0,
        'DateTime' => 0,
        'DateTime::Format::Flexible' => 0,
    },
    META_MERGE   => {
        resources => {
            repository  =>  'https://github.com/crlcu/mojo-validation',
        },
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Mojo-Validation-*' },
);
