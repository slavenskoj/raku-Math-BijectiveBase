#!/usr/bin/env raku

use lib 'lib';
use Math::BijectiveBase;

# Basic usage - Spreadsheet columns
say "Spreadsheet columns:";
say "1 -> " ~ to-bijective26(1);      # A
say "26 -> " ~ to-bijective26(26);    # Z
say "27 -> " ~ to-bijective26(27);    # AA
say "703 -> " ~ to-bijective26(703);  # AAA

say "\nReverse conversion:";
say "A -> " ~ from-bijective26('A');      # 1
say "AA -> " ~ from-bijective26('AA');    # 27
say "AAA -> " ~ from-bijective26('AAA');  # 703

# Different bases
say "\nDifferent bases:";
say "100 in bijective base-52: " ~ to-bijective52(100);
say "100 in bijective base-36: " ~ to-bijective36(100);
say "100 in bijective base-62: " ~ to-bijective62(100);

# Custom alphabets
say "\nCustom alphabets:";
my @emoji = <😀 😁 😂 😃>;
say "1 in emoji: " ~ to-bijectivebase(1, @emoji);
say "5 in emoji: " ~ to-bijectivebase(5, @emoji);

my @binary = <0 1>;
say "1 in binary bijective: " ~ to-bijectivebase(1, @binary);
say "4 in binary bijective: " ~ to-bijectivebase(4, @binary);

# Practical example: Generate column headers
say "\nFirst 10 spreadsheet columns:";
for 1..10 -> $n {
    say "Column $n: " ~ to-bijective26($n);
}