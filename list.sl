/*
 * Nested (singly-linked) list implementation for integers making use of both
 * Inheritance and Dynamic Dispatch
 *
 * There are 4 operations defined on List objects:
 *
 *   - isNil()     Returns true if 'l' is empty, false otherwise
 *   - head()      Returns the integer at the head of 'l' (i.e., the first 
 *                 element).  If 'l' is empty,execution aborts.
 *   - tail()      Returns the remainder of 'l', (i.e., without the head)
 *   - cons(i)     Returns a new list containing i as the first element, 
 *                 followed by the elements in 'l'.
 *
 * There are two kinds of list: empty lists and non-empty lists.  List defines
 * operations on empty lists, and Cons inherits from List to redefine operations
 * that differ for non-empty lists.
 */

class List {
    // defines operation on empty lists

    isNil() { true; };

    head() { abort(); };

    tail() { abort(); };

    /*
     * When we cons an element onto the empty list, we get a non-empty list.
     * The (new Cons) expression creates a new list cell of class Cons, which 
     * is then initialized by a dispatch to init().  
     */
    cons(i) {
        (new Cons).init(i, self);
    };
};

class Cons : List {
    /*
     * Cons inherits all operations from List.  We can reuse only the cons
     * method (the operation is the same).  All other methods must be re-
     * defined, since their behavior is different than with an empty list.
     */
    
    // two attributes for storing the head (car) and tail (cdr)
    // see https://en.wikipedia.org/wiki/CAR_and_CDR for naming

    let car;
    let cdr;

    /*
     * used by cons() to initialize the cell
     */
    init(i, rest) {
        car = i;
        cdr = rest;
        self;
    };

    isNil() { false; };

    head() { car; };

    tail() { cdr; };
};

/*
 * The Main class shows how to use a List.  It creates a small list and then 
 * repeatedly prints out its elements and takes off the first element of the 
 * List.
 */
class Main : IO {

    /*
     * Print all elements of the list.  Calls itself recursively with the 
     * tail of the list, until the end of the list is reached.
     */
    print_list(l) {
        if (l.isNil()) {
            print_string("\n");
        } else {
            print_int(l.head());
            print_string(" ");
            print_list(l.tail());
        };
    };

    /*
     * Note how the dynamic dispatch mechanism is responsible for ending the 
     * while loop.  As long as mylist is bound to an object of type Cons, the 
     * dispatch isNill calls the isNil method of the Cons class, which returns 
     * false.  However, when we reach the end of the list, mylist gets bound 
     * to the object that was created by the (new List) expression.  This has
     * a dynamic type of List, and thus the method isNil in the List class is 
     * called, returning true.
     */
    main() {
        let mylist = new List.cons(1).cons(2).cons(3).cons(4).cons(5);
        while (!mylist.isNil()) {
            print_list(mylist);
            mylist = mylist.tail();
        };
    };
};