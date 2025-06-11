# Math::BijectiveBase

A Raku module for bijective base encoding and decoding. Bijective base systems are used in applications like spreadsheet column numbering (A, B, ..., Z, AA, AB, ...). Common use cases include generating unique identifiers, creating compact URL shorteners, database sharding keys, and any scenario where you need a natural ordering without gaps or zero values.

## Synopsis

```raku
use Math::BijectiveBase;

# Encode numbers to spreadsheet column names
say to-bijective26(1);      # A
say to-bijective26(26);     # Z
say to-bijective26(27);     # AA
say to-bijective26(703);    # AAA

# Decode back to numbers
say from-bijective26('A');   # 1
say from-bijective26('AA');  # 27
say from-bijective26('AAA'); # 703

# Use different bases
say to-bijective52(100);     # Av (using A-Z,a-z)
say to-bijective36(100);     # 2U (using 1-9,A-Z)
say to-bijective62(100);     # Al (using A-Z,a-z,0-9)

# Custom alphabets
my @greek = <α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ω>;
say to-bijectivebase(25, @greek);   # αα
say from-bijectivebase('ω', @greek); # 24
```

## Description

Bijective base-k numeration is a numeral system that uses k digits to represent numbers, but without a zero digit. Instead, the digits are 1, 2, ..., k. This creates a one-to-one correspondence between the set of positive integers and the set of finite strings over an alphabet of size k.

The most common example is spreadsheet column numbering:
- A = 1
- B = 2
- ...
- Z = 26
- AA = 27
- AB = 28
- ...

## Installation

```bash
zef install Math::BijectiveBase
```

## Functions

### Core Functions

- `to-bijectivebase(Int $n, @alphabet)` - Convert a positive integer to bijective representation using the given alphabet
- `from-bijectivebase(Str $s, @alphabet)` - Convert a bijective string back to an integer

### Convenience Functions

- `to-bijective26(Int $n)` - Convert to base-26 (A-Z)
- `from-bijective26(Str $s)` - Convert from base-26
- `to-bijective52(Int $n)` - Convert to base-52 (A-Z,a-z)
- `from-bijective52(Str $s)` - Convert from base-52
- `to-bijective36(Int $n)` - Convert to base-36 (1-9,A-Z)
- `from-bijective36(Str $s)` - Convert from base-36
- `to-bijective62(Int $n)` - Convert to base-62 (A-Z,a-z,0-9)
- `from-bijective62(Str $s)` - Convert from base-62

### Predefined Alphabets

- `@base26-alphabet` - A..Z
- `@base52-alphabet` - A..Z, a..z
- `@base36-alphabet` - 1..9, A..Z
- `@base62-alphabet` - A..Z, a..z, 0..9
- `@numeric-alphabet` - 1..9

## Design Principles

- **Minimal surface area** - Just does conversion
- **String output** - Bijective naturally produces strings like "AA"
- **Strict validation** - Rejects invalid inputs early
- **Zero dependencies** - Pure Raku implementation

## Author

Danslav Slavenskoj

## Copyright and License

Copyright 2025 Danslav Slavenskoj

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

## Source

[https://github.com/slavenskoj/raku-Math-BijectiveBase](https://github.com/slavenskoj/raku-Math-BijectiveBase)