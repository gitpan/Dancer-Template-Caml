package Dancer::Template::Caml;

use strict;
use warnings;

require Carp;
use Text::Caml;

use base 'Dancer::Template::Abstract';

our $VERSION = '0.009001';

my $_engine;

sub default_tmpl_ext {"caml"}

sub init {
    my $self = shift;

    my %args = (%{$self->config},);

    $_engine = Text::Caml->new(%args);
}

sub render {
    my ($self, $template, $tokens) = @_;

    if (!ref $template) {
        -f $template
          or Carp::croak("'$template' doesn't exist or not a regular file");
    }

    return $_engine->render_file($template, $tokens);
}

1;

=head1 DESCRIPTION

This class is an interface between Dancer's template engine abstraction layer
and the L<Text::Caml> module.

In order to use this engine, use the template setting:

    template: caml

=head1 METHODS

=head2 C<render>

    $engine->render;

Render template.

=head2 C<default_tmpl_ext>

Default template extention is C<caml>.

=head2 C<init>

    $engine->init;

Initialize engine (done by L<Dancer>).

=head1 SEE ALSO

L<Dancer>, L<Text::Caml>

=head1 DEVELOPMENT

=head2 Repository

    http://github.com/vti/dancer-template-caml

=head1 AUTHOR

Viacheslav Tykhanovskyi, C<vti@cpan.org>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011, Viacheslav Tykhanovskyi

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=cut
