unit module Math::BijectiveBase;

# Core conversion functions
sub to-bijectivebase(Int $n where * > 0, @alphabet) is export {
    my $result = '';
    my $num = $n;
    my $base = @alphabet.elems;
    
    die "Alphabet cannot be empty" unless $base > 0;
    
    while $num > 0 {
        $num--;
        $result = @alphabet[$num % $base] ~ $result;
        $num div= $base;
    }
    
    return $result;
}

sub from-bijectivebase(Str $s, @alphabet) is export {
    my $base = @alphabet.elems;
    die "Alphabet cannot be empty" unless $base > 0;
    
    my %decode-map = @alphabet.kv.map(-> $i, $c { $c => $i + 1 }).flat;
    
    my $result = 0;
    for $s.comb -> $char {
        die "Invalid character '$char' not in alphabet" 
            unless %decode-map{$char}:exists;
        $result = $result * $base + %decode-map{$char};
    }
    
    return $result;
}

# Standard alphabets
our @base26-alphabet = 'A'..'Z';
our @base52-alphabet = flat('A'..'Z', 'a'..'z');
our @base36-alphabet = flat('1'..'9', 'A'..'Z');
our @base62-alphabet = flat('A'..'Z', 'a'..'z', '0'..'9');
our @numeric-alphabet = '1'..'9';

# Convenience functions for common bases
sub to-bijective26(Int $n where * > 0) is export {
    to-bijectivebase($n, @base26-alphabet)
}

sub from-bijective26(Str $s) is export {
    from-bijectivebase($s, @base26-alphabet)
}

sub to-bijective52(Int $n where * > 0) is export {
    to-bijectivebase($n, @base52-alphabet)
}

sub from-bijective52(Str $s) is export {
    from-bijectivebase($s, @base52-alphabet)
}

sub to-bijective36(Int $n where * > 0) is export {
    to-bijectivebase($n, @base36-alphabet)
}

sub from-bijective36(Str $s) is export {
    from-bijectivebase($s, @base36-alphabet)
}

sub to-bijective62(Int $n where * > 0) is export {
    to-bijectivebase($n, @base62-alphabet)
}

sub from-bijective62(Str $s) is export {
    from-bijectivebase($s, @base62-alphabet)
}