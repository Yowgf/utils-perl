my $target_file = $ARGV[0]
my $entire_file_str = do {
    local $/;
    open my $fh, "<", $target_file;
    <$fh>;
};
print "$entire_file_str"
