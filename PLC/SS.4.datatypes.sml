fun funny_sum xs =

     case xs of

         [] => 0

       | (I i)::xs' => i + funny_sum xs'

       | (S s)::xs' => String.size s + funny_sum xs'

val xs = [I 5, S "hello", I ~3, S "testing"]

val ans = funny_sum xs
