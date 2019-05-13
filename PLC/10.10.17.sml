(*
    -----------
    EXERCISE #1
    -----------
    Write a function card_value, which takes a card and returns its value
    (numbered cards have their number as the value, aces are 11, everything
    else is 10).
    -----------
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

val card1 = (Spades, Queen);
val card2 = (Spades, Ace);
val r1 = card_value(card1);
val r1 = card_value(card2);
val r2 = card_value(Clubs, Ace);
val r3 = card_value(Diamonds, Num 4);


(*
    -----------
    EXERCISE #2
    -----------
    Write a function remove_card, which takes a list of cards cs, a card c,
    and an exception e. It returns a list that has all the elements of cs
    except c. If c is in the list more than once, remove only the first one.
    If c is not in the list, raise the exception e. You can compare cards with =.
    -----------
*)

exception IllegalMove

fun remove_card(cs, c, e) =
    if null(cs)
    then raise e
    else if (hd(cs)) = c
          then (tl cs)
          else (hd cs)::remove_card(tl(cs),c,e);

val cardList = [(Spades, Queen), (Spades, Ace), (Clubs, Ace), (Hearts, Num 7), (Diamonds, Num 4)];
val searchCard = (Hearts, Num 7);
val result = remove_card(cardList, searchCard, IllegalMove);

val searchCard2 = (Hearts, Num 9);
val result2 = (remove_card(cardList, searchCard2, IllegalMove))

val result3 = remove_card([3, 5, 67, 123], 123, IllegalMove);

(*
    -----------
    EXERCISE #3
    -----------
*)
