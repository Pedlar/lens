package Lensmoor;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/who/:name')->to('public#whois');
  $r->get('/who')->to('public#whoon');
  $r->get('/help/:name')->to('public#help');
}

1;
