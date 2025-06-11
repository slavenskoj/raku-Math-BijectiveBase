use Test;
use Math::BijectiveBase;

# Test base26 (spreadsheet columns)
is to-bijective26(1), 'A', '1 -> A';
is to-bijective26(26), 'Z', '26 -> Z';
is to-bijective26(27), 'AA', '27 -> AA';
is to-bijective26(52), 'AZ', '52 -> AZ';
is to-bijective26(53), 'BA', '53 -> BA';
is to-bijective26(702), 'ZZ', '702 -> ZZ';
is to-bijective26(703), 'AAA', '703 -> AAA';

is from-bijective26('A'), 1, 'A -> 1';
is from-bijective26('Z'), 26, 'Z -> 26';
is from-bijective26('AA'), 27, 'AA -> 27';
is from-bijective26('AZ'), 52, 'AZ -> 52';
is from-bijective26('BA'), 53, 'BA -> 53';
is from-bijective26('ZZ'), 702, 'ZZ -> 702';
is from-bijective26('AAA'), 703, 'AAA -> 703';

# Round-trip tests
for 1..1000 -> $n {
    is from-bijective26(to-bijective26($n)), $n, "Round-trip base26 for $n";
}

# Test other bases
is to-bijective52(52), 'z', 'base52: 52 -> z';
is to-bijective52(53), 'AA', 'base52: 53 -> AA';
is from-bijective52('z'), 52, 'base52: z -> 52';
is from-bijective52('AA'), 53, 'base52: AA -> 53';

is to-bijective36(36), '11', 'base36: 36 -> 11';
is from-bijective36('11'), 36, 'base36: 11 -> 36';

is to-bijective62(62), '9', 'base62: 62 -> 9';
is to-bijective62(63), 'AA', 'base62: 63 -> AA';
is from-bijective62('9'), 62, 'base62: 9 -> 62';
is from-bijective62('AA'), 63, 'base62: AA -> 63';

# Test custom alphabets
my @greek = <α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ω>;
is to-bijectivebase(1, @greek), 'α', 'Greek: 1 -> α';
is to-bijectivebase(24, @greek), 'ω', 'Greek: 24 -> ω';
is to-bijectivebase(25, @greek), 'αα', 'Greek: 25 -> αα';
is from-bijectivebase('ω', @greek), 24, 'Greek: ω -> 24';
is from-bijectivebase('αα', @greek), 25, 'Greek: αα -> 25';

# Test error handling
dies-ok { to-bijective26(0) }, 'Dies on zero';
dies-ok { to-bijective26(-5) }, 'Dies on negative';
dies-ok { from-bijective26('0') }, 'Dies on invalid character';
dies-ok { to-bijectivebase(1, []) }, 'Dies on empty alphabet';

done-testing;