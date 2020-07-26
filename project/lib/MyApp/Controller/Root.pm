package MyApp::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    # $c->res->headers->{'Content-Type'} = 'application/json; charset=utf-8';
    $c->response->body(qq{
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Купить беляши в москве</title>
</head>
<body>
    <h2>Купить беляши в москве</h2>
    <h3>Аджаил рулит!!!</h3>
</h2>
</body>
</html>
    });
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
