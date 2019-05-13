fun sum_list (xs: int list) =
	if (null xs)
	then 0
	else (hd xs) + sum_list(tl xs);

sum_list([5,3,7]);

fun count_list (xs : int list) =
	if (null xs)
	then 0
	else (hd xs) + sum_list(tl xs);

count_list([5,3,7]);

val x = 8 :: 76 :: [1,2,3];

fun countdown(x: int) =
	if x = 0
	then []
	else x :: countdown(x - 1);

countdown(10);

fun countup(x: int, y: int) =
	if x = y + 1
	then []
	else x :: countup(x + 1, y);

countup(1,10);
countup(2,7);

fun printValue(stock: string * int * int) =
	print( (#1 stock) ^ " : " ^ Int.toString((#2 stock) * (#3 stock)) ^ "\n");

val appleStock = ("APPL", 100, 5);
printValue(appleStock);

val ibmStock = ("IBM", 30, 10);

fun compareValue(xs: string * int * int, ys: string * int * int) =
	if (((#2 xs) * (#3 xs)) > ((#2 ys) * (#3 ys)))
	then (#1 xs)
	else (#1 ys);

compareValue(ibmStock, appleStock);

val googleStock = ("GOOG", 30, 50);
compareValue(appleStock, googleStock);

fun stockValue(stock: string * int * int) =
	((#2 stock) * (#3 stock));

fun findMaxValue(stocks: (string * int * int) list) =
	if (tl stocks) = []
	then (hd stocks)
	else let
					val tlMax = findMaxValue(tl stocks);
					val tlMaxValue = stockValue(tlMax)
				in
					if stockValue(hd stocks) > tlMaxValue
					then (hd stocks)
					else tlMax;
				end

val ibmStock = ("IBM", 5, 75);
val googleStock = ("GOOG", 70, 15);
val facebookStock = ("FB", 20, 8);
val stockList = (appleStock, ibmStock, googleStock, facebookStock);

findMaxValue(stockList);

(*
		------------
    CASE EXAMPLE
    ------------
		# EVEY PART OF THE BRANCH NEEDS TO RETURN THE SAME TYPE #
*)

datatype mytype = TwoInts of int * int
                  | Str of string
                  | Pizza

fun f(x) =
        case x of
          Pizza => 3
        | TwoInts(x,y) => x + y
        | Str(q) => String.size(q)

val t1 = TwoInts(5,4);
f(t1);
val t2 = Str("example");
f(t2);
val t3 = Pizza;
f(t3);
