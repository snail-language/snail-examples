# snail-examples
This repository contains a few simple snail programs as examples of computation
in the language.  These are useful both for understanding snail and also for
basic test cases for an implementation of the language specification.

These are all positive test cases.  That is, they should all scan, parse, and
execute correctly.  No negative test cases are provided in this current commit
of the repository.

## Program Descriptions

Descriptions of programs in this repository are provided below in alphabetical
order.

* `arith.sl`: a "menu-driven" interactive desktop calculator (includes an inlined version of atoi)
* `array-sort.sl`: an array example that includes sorting, dynamic allocation,
  and reversing.
* `atoi.sl`: an integer-to-string and string-to-integer class for snail
* `cells.sl`: simple cellular automaton simulator
* `complex.sl`: a complex number arithmetic and equality regression test
* `hello-int.sl`: prints "9223372036854775807\n" to standard output
* `hello-world.sl`: prints "Hello, world.\n" to standard output
* `list.sl`: a well-commented linked list example
* `oh-no.sl`: a torture regression test (called "hairy-scary" in Cool)
* `primes.sl`: a "methodless" program that enumerates all of the primes between
  2 and 500. It is not a good example of object-oriented style, but shows of the
  expression-based-language features of snail.
* `print-snail.sl`: a more complicated "hello-world" that prints "snail\n"

# License

These programs are released with the BSD 3-Clause open-source license.  Please
correctly attribute any derivatives of this work.

# Acknowledgments
These programs are adapted from a set of example Cool programs released by Wes
Weimer in 2007.  Some of these programs were developed by others, who are
directly attributed in the comments of each individual program.