(*
    -----------
    EXERCISE #1
    -----------
    Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option.
    It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.
    Evaluating a correct homework solution should generate these bindings:
    val oldest = fn : (int * int * int) list -> (int * int * int) option
*)

fun is_older((y1,m1,d1), (y2,m2,d2)) =
  if y1 = y2
  then if m1 = m2
          then d1 < d2
          else m1 < m2
  else y1 < y2;

fun oldest(dates) =
  case dates of
    [] => NONE
  | date::[] => SOME (date)
  | date::rest => let
                      val oldest_in_tail = oldest(rest)
                  in
                      if is_older(date, valOf(oldest_in_tail))
                      then SOME date
                      else oldest_in_tail
                  end;

(* TEST CASES: *)
val test6 = oldest([(2012,2,28),(2017,3,31),(2010,5,20)]) = SOME (2010,5,20)
val test7 = oldest([]) = NONE
val test8 = oldest([(2017,10,5)]) = SOME(2017,10,5)


(*
    -----------
    EXERCISE #2
    -----------
    The remainders of today’s exercises use these datatypes:
    datatype suit = Clubs | Diamonds | Hearts | Spades
    datatype rank = Jack | Queen | King | Ace | Num of int
    type card = suit * rank
    datatype color = Red | Black
    Write a function card_color which takes an argument of type card and
    returns its color (spades and clubs are black, diamonds and hearts are red).
*)

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank
datatype color = Red | Black

fun card_color1(c: card) =
  if (#1 c) = Clubs orelse (#1 c) = Spades
  then Black
  else Red;

val r1 = card_color1((Clubs, Jack));
val r1 = card_color1((Diamonds, Num(10)));
