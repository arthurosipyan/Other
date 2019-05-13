(*
    -----------
    EXERCISE #1
    -----------
*)

fun number_in_month (dates, month) =
    case dates of
      [] => 0
    | (y,m,d)::rest => if m = month
                          then 1 + number_in_month(rest, month)
                          else number_in_month(rest, month);

val test1 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2 = number_in_month([(2012,2,28),(2013,12,1),(2017,3,5)],3) = 2
val test3 = number_in_month([],2) = 0

(*
    -----------
    EXERCISE #2
    -----------
*)

fun number_in_months(dates, months) =
    case months of
    [] => 0
  | month::rest => number_in_month(dates, month) + number_in_months(dates, rest);

val test = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
