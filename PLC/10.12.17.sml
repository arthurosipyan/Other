(*
    -----------
    EXERCISE #1
    -----------
    Write ML expressions that do the following:
    1. Defines a datatype investment with two subtypes:
    Stock - a tuple consisting of a symbol (string), price (int) and shares (int)
    Cash - a single int representing an amount of money
    2. Defines a function valueOf that takes one investment as its argument and:
    if the investment is a Stock, returns the value of price x shares
    if the investment is Cash, returns the amount of money in cash
    3. Binds a Stock investment with values ("AAPL", 100, 5) to the variable appleStock
    4. Calls the function valueOf with the variable appleStock
    5. Binds a Cash investment with the value 200 to the variable myCash
    7. Calls the function valueOf with the variable myCash
    -----------
*)

datatype investment = Stock of string * int * int
                    | Cash of int;

fun valueOf(inv) =
  case inv of
    Stock(_, price, shareCount) => price * shareCount
  | Cash(amt) => amt;

val appleStock = Stock("APPL", 100, 5);
val cashInv = Cash(200);

val ans1 = valueOf(appleStock);
val ans2 = valueOf(cashInv);

(*
    -----------
    EXERCISE #2
    -----------
    Write ML expressions that do the following:
    1. Defines a NegativeValue exception
    2. Defines a function printValue that takes an investment as an argument and:
    if the investment is a Stock, and price x shares is less than zero,
     raises a NegativeValue exception
    otherwise, if the investment is a Stock, prints out the stock symbol
    and the value of price x shares
    if the investment is Cash, prints out “Cash = “ and the amount of money in cash
    3. Calls the function printValue with the variable appleStock
    4. Calls the function printValue with the variable myCash
    5. Binds a Stock investment with values ("AAPL", -100, 5) to the variable badStock
    6. Calls the function printValue with the variable badStock
    -----------
*)

exception NegativeValue

fun printValue(inv) =
  case inv of
          Stock(symb, price, shareCount) => if (price*shareCount < 0)
                                            then raise NegativeValue
                                            else print(symb ^ " " ^ Int.toString(price*shareCount))
        | Cash(amt) => print("Cash = " ^ Int.toString(amt) ^ "\n");


val ans1 = printValue(appleStock);
val ans2 = printValue(cashInv);

val badStock = Stock("BadCompany", ~100, 5);
val test3 = printValue(badStock);
