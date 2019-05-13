(* ---------- *)
(* Exercise 1 *)
(* ---------- *)

val ibmStock = ("IBM", 30, 10)
val appleStock = ("AAPL", 100, 5)
val googleStock = ("GOOG", 70, 15)
val fbStock = ("FB", 20, 8)

fun findMaxValueLet(stocks: (string * int * int) list) =
  let
    fun compareValue(s1: string * int * int, s2: string * int * int) =
    ((#2 s1) * (#3 s1) > (#2 s2) * (#3 s2));
  in
    if (tl stocks) =[]
    then (hd stocks)
    else let
            val tlMax = findMaxValueLet(tl stocks)
          in
            if compareValue((hd stocks), (tlMax))
            then (hd stocks)
            else (tlMax)
          end
  end

val stockList = [appleStock, ibmStock, googleStock, fbStock];
val result = findMaxValueLet(stockList);

(* ---------- *)
(* Exercise 2 *)
(* ---------- *)

fun is_older((y1, m1, d1), (y2, m2, d2)) =
    if y1 = y2
    then if m1 = m2
            then d1 < d2
            else m1 < m2
    else y1 < y2

val d1 = (2017, 9, 28);
val d2 = (2017, 12, 25);

val test1 = (is_older((1,2,3),(2,3,4)) = true)
val test2 = (is_older(d1, d1) = false)
val test3 = (is_older(d1, d2) = true)
val test4 = (is_older(d2, d1) = false)

(* ---------- *)
(* Exercise 3 *)
(* ---------- *)

(*

Write a function get_nth that takes a list of strings and an int n and returns
the nth element of the list where the head of the list is 1st.
Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay.

Evaluating a correct solution should generate these bindings:
val get_nth = fn : string list * int -> string

Test your code with these expressions:
val test4 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"

*)

fun get_nth(strings, n) =
  if n = 1
  then (hd strings)
  else get_nth((tl strings), n-1)

val test1 = (get_nth(["hi", "there", "how", "are", "you"], 2) = "there")
val test2 = (get_nth(["hi", "there", "how", "are", "you"], 1) = "hi")
val test3 = (get_nth(["hi", "there", "how", "are", "you"], 5) = "you")
