(*
--------------------------------------------------------------------------------
    EXERCISE #1
--------------------------------------------------------------------------------
    Write SML expressions to define a function which uses lexical scoping to
    accept a list of objects and return a list of tuples containing the same
    objects prepended with a constant.
--------------------------------------------------------------------------------
*)
val x =[1,2,3];

fun f xs =
  case xs of
  [] => []
| first::rest => (x,first)::f(rest)

val x = true;
val t1 = f([10,20,30,40,50,60]);

(*
--------------------------------------------------------------------------------
    EXERCISE #2
--------------------------------------------------------------------------------
    Write an SML expression that uses the function filter above with an
    anonymous function to bind a list of all investments with a value greater
    than 250 to the variable ans3
--------------------------------------------------------------------------------
*)

fun map(f,xs) =
  case xs of
    [] => []
  | first::rest => (f first)::(map(f,rest))

fun filter(f,xs) =
  case xs of
    [] => []
  | first::rest => if f first
                  then first::(filter(f,rest))
                  else filter(f,rest)

type date = (int*int*int)
datatype investment = Stock of string * int * int * date
                    | Cash of int * date

fun valueOf(i) =
  case i of
    Stock(_,p,s,_) => p * s
  | Cash(a,_) => a

val appleStock = Stock("AAPL", 100, 5, (2015,5,10));
val myCash = Cash(200,(2014,3,7));
val googleStock = Stock("GOOG", 70, 15, (2014,8,3));
val fbStock = Stock("FB", 20, 8, (2015,2,9));
val ibmStock = Stock("IBM", 30, 10, (2010,6,20));
val investmentList = [appleStock,myCash,googleStock,fbStock,ibmStock];

val test = filter((fn i => valueOf i > 250), investmentList);

(*
--------------------------------------------------------------------------------
    EXERCISE #3
--------------------------------------------------------------------------------
    Write an SML function nameLength which returns the length of an investment’s
    name. If the investment is a stock, measure the length of the stock label;
    if the investment is cash, it has no name to measure, so return 0.

    Once your nameLength function is working, use it with the filter function
    to take a list of investments and return only those investments with names
    longer than 3 characters.
--------------------------------------------------------------------------------
*)

fun nameLength(invest) =
  case invest of
    Cash(_,_) => 0
  | Stock(n,_,_,_) => String.size n

val test2 = nameLength(ibmStock);
val test2 = nameLength(myCash);

val test4 = filter(fn i => nameLength(i) > 3, investmentList);

(*
--------------------------------------------------------------------------------
    EXERCISE #4
--------------------------------------------------------------------------------
    Write an SML function which accepts a list of references to integers as
    input, applies a function to the reference values, and returns a list of
    the values as output.
    Example:
    val myList = [ref 1,ref 3, ref 10]
    fun myFunc x = x * 2
    val result = refFuncs myFunc myList
    val result = [2,6,20]
--------------------------------------------------------------------------------
*)

val myList = [ref 1, ref 3, ref 10];
fun myFunc x = x*2;

fun refFuncs f myList =
  case myList of
  [] => []
| first::rest => f(!first)::refFuncs f rest

val result = refFuncs myFunc myList;
