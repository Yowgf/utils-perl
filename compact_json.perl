$/ = \1;

open(FH, '<', $ARGV[0]) or die $!;

$quote = 0;
$escape = 0;
while ($c = <FH>) {
    $escape = 0;
    if ($c eq '\\') {
	print $c;
	# When a escape, see if next character is a quote
	# Assume that EOF cannot be after a escape character (valid JSON)
	$escape = 1;
	$c = <FH>;
    }
    if ((not $escape) and ($c eq '"')) {
	$quote = not $quote;
	print $c
    } else {
	if ($quote) {
	    print $c;
	}
	else {
	    # Only print if not a space
	    if (($c ne ' ') and ($c ne '\t') and ($c ne '\n') and ($c ne '\r')) {
		print $c;
	    }
	}
    }
}
