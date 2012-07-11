package Lensmoor::Public;
use Mojo::Base 'Mojolicious::Controller';
use Lensmoor::Socket;
use Lensmoor::Utils;

sub whois {
  my $self = shift;
  my($name) = $self->stash('name');
  $self->render_json({
                         type => "whois",
                         name => $name,
                         body => Lensmoor::Utils::spanToFont(Lensmoor::Socket::getWhois($name))
                     });
}

sub whoon {
  my $self = shift;
  $self->render_json({ 
                         type => "who", 
                         body => Lensmoor::Utils::spanToFont(Lensmoor::Socket::getWhoOn()) 
                     });
}

sub help {
  my $self = shift;
  my($name) = $self->stash('name');
  $self->render_json({ 
                         type => "help", 
                         name => $name, 
                         body=> Lensmoor::Utils::spanToFont(Lensmoor::Socket::getHelp($name)) 
                     });
}

1;
