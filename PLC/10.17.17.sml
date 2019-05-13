(*
    -----------
    EXERCISE #1
    -----------
    Exercise 1
    Write an SML function even int->bool which uses tail recursion
    to return true if its argument is even and false otherwise
    -----------
*)

fun even(x) =
  if x = 0
  then true
  else (not (even(x-1)));

val test1 = even(200);
val test2 = even(245);
val test3 = even(0);
val test4 = even(1);

fun skip(L) =
  if L = nil
  then nil
  else take(tl(L))
and
take(L) =
  if L = nil
  then nil
  else hd(L)::skip(tl(L));

val r1 = take([1,2,3,4,5]);
val r1 = skip([1,2,3,4,5]);

(*
    -----------
    EXERCISE #2
    -----------
    Modify your code from exercise 1 to make an SML function odd int->bool which
    uses tail recursion to return true if its argument is even and false otherwise.
    Then modify both functions to make them mutually recursive.
    -----------
*)

fun even(x) =
  if x = 0
  then true
  else (odd(x-1))
and
odd(x) =
  if x = 0
  then false
  else (even(x-1));

val test5 = odd(200);
val test6 = odd(245);
val test7 = odd(0);
val test8 = odd(1);

(*
    -----------
    EXERCISE #3
    -----------
    Write an SML function sum_of_squares int list -> int
    which squares each list element and adds up the resulting value.
    Get the function working using basic recursion first, then write a
    second version which utilizes tail recursion.
    -----------
*)

fun sum_of_squares(numList) =
  case numList of
  [] => 0
| first::rest => (first*first) + sum_of_squares(rest)

fun sum_of_squares(numList) =
  let
    fun ss_aux(numList,acc) =
        case numList of
        [] => acc
      | first::rest => ss_aux(rest,(first*first)+acc)
  in
    ss_aux(numList,0)
  end

(*)
fun sum_of_squares(xs) =
  if null xs
  then 0
  else ((hd xs) * (hd xs)) + sum_of_squares(tl xs);
*)

val test9 = sum_of_squares([1,5,3]);
val test10 = sum_of_squares([2,3]);
