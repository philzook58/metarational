(* https://github.com/ocaml/Zarith/blob/master/q.ml *)
module Q = struct
  type t = { num : int; den : int }

  let recip x = { num = x.den; den = x.num }

  let approx newden x = { num = x.num * newden / x.den; den = newden }

  let ( / ) x y = { num = x.num * y.den; den = x.den * y.num }
  let ( // ) x y = { num = x; den = y }

  let ( + ) x y =
    { num = (x.num * y.den) + (y.num * x.den); den = x.den * y.den }

  let ( * ) x y = { num = x.num * y.num; den = x.den * y.den }
end

module Qacc = struct
  type t = { num : int; 
             den : int;
             (* range : int;  This field does not make sense yet*)
             eps : Z.Q.t (* or interval?
             An interesting point is that typically center + width ~ left + right, except now we want to push different pieces in 
             to different stages.
             Having left code and right compile coukd make sense, but it would be unusual
             
              *) 
            }

  let recip x = { num = x.den; den = x.num; eps = }

  let approx newden x = { num = x.num * newden / x.den; den = newden }

  let ( / ) x y = { num = x.num * y.den; den = x.den * y.num }

  let ( + ) x y =
    { num = (x.num * y.den) + (y.num * x.den); den = x.den * y.den }

  let ( * ) x y = { num = x.num * y.num; den = x.den * y.den }
end


(* module Qdyad = struct
  type t = { num : int; twon : int }

  (*
     n/2^d + m / 2^e = 2^e n + 2^d m / 2 ^ e
  *)
  let ( + ) x y = { num = x.num << y.den + y.num << x.den; den = x.den + y.den }
end


module 
axiom
|-
end

module   ()
   include
end

sig 
   x = y
end


*)