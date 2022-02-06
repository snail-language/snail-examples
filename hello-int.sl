/*
 * Prints "9223372036854775807\n" to standard output.
 */

class Main : IO {
    main() {
        // Integer wraparound
        // 2 ^ (64 - 1) = -9,223,372,036,854,775,808
        print_int(~9223372036854775807 - 2);
        print_string("\n");
    };
};