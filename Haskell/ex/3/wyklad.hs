-- z wykladu
-- [x ^ 2 | x <- [1..5]]


--[x | x <- [1..10], x/=5] ---------- lista bez 6 elementu


delnth (n, list) = map (\id -> list!!id ) (filter (\id -> id /=n) [0..length(list)-1])

delnth2 (n, list) = map (\id -> list!!id ) [x | x <- [0..length(list)-1], x/=n]
--
firsts :: [(a, b)] -> [a]
firsts(tuple) = [first | (first,_) <- tuple]



factors :: Int -> [Int]
factors(n) = [x | x <- [1..n], mod n x == 0]

function(n) = map (\id -> id) [0..n]

length2(list) = sum (map (\el -> if el>0 then 1 else 0) list


dodaj = \x y -> x+y
