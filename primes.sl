/*
 * methodless-primes.cl
 *
 * Designed by Jesse H. Willett, jhw@cory, 11103234, with 
 *             Istvan Siposs, isiposs@cory, 12342921.
 *
 * Ported to snail by Kevin Angstadt (https://github.com/kevinaangstadt)
 *
 * This program generates primes in order without using any methods.
 * Actually, it does use three methods: those of IO to print out each
 * prime, and abort() to halt the program.  These methods are incidental,
 * however, to the information-processing functionality of the program.  We
 * could regard the attribute 'out's sequential values as our output, and
 * the string "halt" as our terminate signal.
 *
 * Naturally, using snail this way is a real waste, basically reducing it 
 * to assembly without the benefit of compilation.  
 *
 * There could even be a subroutine-like construction, in that different
 * code could be in the assign fields of attributes of other classes,
 * and it could be executed by calling 'new Sub', but no parameters
 * could be passed to the subroutine, and it could only return itself.
 * but returning itself would be useless since we couldn't call methods
 * and the only operators we have are for Int and Bool, which do nothing
 * interesting when we initialize them!
 */

class Main : IO {
    // main() is not even needed because we abort 
    // before getting here.

    // out is our "output".  Its values are the primes.
    let out = {
        print_string("2 is trivially prime.\n");
        2;
    };

    // testee is a number to be tested for primeness
    let testee = out;

    // divisor is a number which may factor testee
    let divisor = 0;

    // stop is an arbitrary value limiting testee
    let stop = 500;

    // m supplants the main method
    let m = while(true) {
        testee = testee + 1;
        divisor = 2;

        while (
            if (testee < divisor * divisor) {
                false; // can stop is divisor > sqrt(testee)
            } else {
                if (testee - divisor*(testee/divisor) == 0) {
                    false; // can stop if divisor divides testee
                } else {
                    true;
                };
            } // no semi-colon because this isn't a block of code
        ) {
            divisor = divisor + 1;
        };

        // which reason did we stop?
        if (testee < divisor * divisor) {
            // testee has no factors less than sqrt(testee)
            out = testee;  // can think of out itself as the output
            print_int(out);
            print_string(" is prime.\n");
        } else {
            // the loop halted on testee/divisor == 0, testee isn't prime.
            0;  // do nothing;
        };

        if (stop <= testee) {
            // "halt" is like a SIGTERM
            "halt".abort();
        } else {
            "continue";
        };
    };
};