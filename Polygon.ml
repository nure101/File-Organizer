
open List 

type poly = 
  PolyEmpty | 
  PolyTerm of int * int * poly 

(* let rec expo e =
  match e with 
  PolyEmpty -> false 
  | PolyTerm (x, y, PolyEmpty) -> 
    if x == 0 || y < 0 
          then false
      else true
  |PolyTerm (x, y, PolyTerm(a, b, c)) -> 
    y > b && expo c *)

let isPolyOk p =
  let rec checking p= 
    match p with 
    PolyEmpty -> true
    | PolyTerm (x, y, PolyEmpty)  -> 
        if x == 0 || y < 0 
          then false
      else true
    |PolyTerm (x, y, PolyTerm(a,b,c))  -> 
        if x == 0 || y < 0 || y < b && checking(PolyTerm(a,b,c))
          then false
      else true
  in checking p


exception MakePolyError of string;;
let rec makePoly i = 
  match i with 
  [] -> PolyEmpty |
  a::e :: tl ->
  let made = makePoly tl in 
  if isPolyOk (PolyTerm (a,e,made)) <> true
    then raise (MakePolyError  "bad poly")
else PolyTerm (a,e,made) |
[_] -> raise (MakePolyError "bad poly")


let rec polyAdd l r =
  match (l, r) with 
  | (PolyEmpty, PolyEmpty) -> PolyEmpty
  | (_, PolyEmpty) -> l
  | (PolyEmpty, _) -> r

  | ((PolyTerm (x,y,z)),(PolyTerm (a,b,c))) ->
    if y > b 
      then PolyTerm(x,y,polyAdd z r)
    else if y < b 
      then PolyTerm(a,b,polyAdd l c)
    else 
      let co = x + a in
      if co == 0
        then polyAdd z c
    else 
      PolyTerm(co,y,polyAdd z c)

let rec polyMinus r =
  match r with 
  PolyEmpty -> PolyEmpty |
  PolyTerm(x,y,poly) -> 
      PolyTerm(-1*x,y,polyMinus poly)

let p = [1;5;2;4;2;3;-1;2;5;0]
let p = makePoly p
let check =  isPolyOk p
(* let q = [7;4;1;2;-4;1;-3;0]
let q = makePoly q
let add = polyAdd p q;; *)

(* 
p =  3x⁵ + 2x⁴ + 2x³ − x² + 5

q =  7x⁴ + x² − 4x − 3 *)
