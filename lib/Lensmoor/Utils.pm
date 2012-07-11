package Lensmoor::Utils;

sub spanToFont {
    my($text) = shift;
    $text =~ s/span style=\"color: /font color=\"/g;
    $text =~ s/\;\"/\"/g;
    $text =~ s/\<\/span\>/<\/font\>/g;
    return $text;
}

1;
