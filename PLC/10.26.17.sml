(*
--------------------------------------------------------------------------------
    EXERCISE #1
--------------------------------------------------------------------------------
    Write a function hand_value which takes five cards as input and calculates
    the total value of all the cards in the hand.
--------------------------------------------------------------------------------
*)

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank
datatype color = Red | Black


fun card_value(c) =
  case c of
  (_, Ace) => 11
| (_, Num i) => i
| (_, _) => 10;

fun hand_value(c0,c1,c2,c3,c4) = card_value(c0) + card_value(c1) +
                        card_value(c2) + card_value(c3) +
                        card_value(c4);

val c0 = (Clubs, Num 7);
val c1 = (Diamonds, King);
val c2 = (Hearts, Num 5);
val c3 = (Spades, Ace);
val c4 = (Clubs, Queen);

val myHand = (c0,c1,c2,c3,c4);

val t1 = hand_value(myHand);

(*
--------------------------------------------------------------------------------
    EXERCISE #2
--------------------------------------------------------------------------------
    Use currying to allow your hand_value function
    to take one card parameter at a time.
--------------------------------------------------------------------------------
*)

val hand_value = fn c0 => fn c1 => fn c2 => fn c3 => fn c4 => card_value(c0)
                        + card_value(c1) + card_value(c2) + card_value(c3) +
                        card_value(c4);

val hand_value2 c0 c1 c2 c3 c4 = card_value(c0) + card_value(c1) +
                        card_value(c2) + card_value(c3) + card_value(c4);

val test = hand_value c0 c1 c2 c3 c4;
