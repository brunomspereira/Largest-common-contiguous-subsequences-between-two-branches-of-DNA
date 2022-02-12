let word1 = read_line();;
let word2 = read_line();;
let size1 = String.length word1;;
let size2 = String.length word2;;

let rec lcs count s1 s2 w1 w2=
   if s1 == 0 || s2 == 0 
   then
   count
   else
      if w1.[s1-1] == w2.[s2-1]
      then
         let x = lcs (count + 1) (s1-1) (s2-1) (w1) (w2) in
         let y = max (lcs (0) (s1) (s2-1) (w1) (w2) ) (lcs (0) (s1-1) (s2) (w1) (w2)) in
         let count = max (x) (y) in
         count
      else
         let var = max (lcs (0) (s1) (s2-1) (w1) (w2)) (lcs (0) (s1-1) (s2) (w1) (w2)) in
         let count = max (count) (var) in
         count;;
let () = Printf.printf "%d\n" (lcs (0) (size1) (size2) (word1) (word2))
