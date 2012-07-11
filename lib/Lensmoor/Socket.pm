package Lensmoor::Socket;
use IO::Socket::INET;
use Net::Telnet;
use Data::Dumper;

our($socket);

sub newSocket {
#   $socket = IO::Socket::INET->new(PeerAddr => "lensmoor.org",
#                                   PeerPort => 3534,
#                                   Proto    => "udp",
#                                   Timeout  => 2);
    $socket = new Net::Telnet (Host => "lensmoor.org",
                               Port => 3534);
}

sub getWhois {
    $name = shift;
    newSocket();
    $socket->print("whois $name");
    @output = $socket->waitfor('/\<\/PRE\>/');
    return join('', @output);
}

sub getWhoOn {
    newSocket();
    $socket->print("who");
    @output = $socket->waitfor('/\<\/PRE\>/');
    return join('', @output);
}

sub getHelp {
    $name = shift;
    newSocket();
    $socket->print("help $name");
    @output = $socket->waitfor('/\<\/PRE\>/');
    return join('', @output);
}

1;
