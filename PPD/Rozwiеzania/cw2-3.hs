--zad1
prelast :: [a] -> a
prelast [] = error "the list can not be empty"
prelast (head:[]) = error "the list should have more than 1 element"
prelast l = last (init l)

--zad2a
second :: [a] -> a
second [] = error "the list can not be empty"
second (head:[]) = error "the list should have more than 1 element"
second l = head (tail l)

--zad2b
third :: [a] -> a
third [] = error "the list can not be empty"
third (first:second:some_list) | length some_list == 0 = error "the list should have more than 2 elements"
		     	  | otherwise = head some_list

--zad3
cover :: [a] -> [a]
cover [] = []
cover (first:some_list) = (cover some_list) ++ [first]

--zad4
firstlast :: [a] -> [a]
firstlast [] = []
firstlast (first:some_list) = [last some_list] ++ init some_list ++ [first]

--zad5a
counteven :: Integral a => [a] -> a
counteven [] = 0
counteven (first:some_list) = if mod first 2 == 0 then 1 + counteven some_list
                                                  else counteven some_list

--zad5b
countdiv3 :: (Int) -> Int
countdiv3(n) = if n<2 then 0
                      else div n 3 

--zad5c
sumdiv3 :: (Int) -> Int
sumdiv3(n) = if n<2 then 0
	                else if mod n 3 == 0 then n + sumdiv3(n-1)
	                	                 else sumdiv3(n-1)

--zad6
evenlength :: [a] -> [Char]
evenlength some_list = if mod (length some_list) 2 == 0 then "parzysta"
	                                                     else "nieparzysta"

--zad7a
powlist :: Num a => [a] -> [a]
powlist some_list = map (^2) some_list

--zad7b
powlist2 :: Num a => [a] -> [a]
powlist2 [] = []
powlist2 (first:some_list) = [(first*first)] ++ (powlist2 some_list)

--zad8
countobject element some_list = length(filter (==element) some_list)

--zad9
multiword n element = [element | a<-[1,2..n]]

--zad10
palindrome some_list = if some_list == (reverse some_list) then True
	                                                       else False

--zad11
delelement element (first:some_list) = if element == first then some_list
                                                           else first : delelement element some_list

--zad12
deln n some_list = take (n-1) some_list ++ drop n some_list

--zad13
power a n = powerPOM a n 1
powerPOM a n x = if n==0 then x
                         else powerPOM a (n-1) (x*a) 

--zad14
checklist [] second = True
checklist (h1:t1) second = if elem h1 second == True then checklist t1 second
                                                     else False 

--zad15
changePOM (a,b) = (b,a)
changeelements (first:some_list) = changePOM first : changeelements some_list
changeelements [] = []










