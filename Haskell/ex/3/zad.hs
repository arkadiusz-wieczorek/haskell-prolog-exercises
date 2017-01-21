-- Zadanie 1.
-- Napisać definicję funkcji wstaw(n,l,e), której wartością jest nowa lista uzyskana przez
-- wstawienie do listy l elementu e na pozycję n.

wstaw(n, l, e) = map (\id -> if id == n then e else l!!id) [0..length(l)-1]

wstaw2(n, l, e) = map (\id -> if id == n then e else l!!id) [0..n] ++ drop n l

-- wstaw(2, [9,9,9,7,7,7,7], 80 )


-- Zadanie 2.
-- Napisać definicję funkcji usun(n,l), której wartością dla niepustej listy jest lista uzyskana
-- przez usunięcie n-tego elementu z listy l.
-- usun(n, list) = map(\id -> list!!id) [0..n-1] ++ [n+1..length(list)-1]
usun(n, list) = map(\id -> list!!id) [0..n-1] ++ map(\id -> list!!id) [n+1..length(list)-1]


-- Zadanie 3.
-- Napisać definicję dwuargumentowej funkcji określonej dla list, której wartością jest prawda,
-- jeśli wszystkie elementy pierwszej listy występują na drugiej liście.

is_member(element, g:o) =
	if element == g
		then True
		else is_member(element, o)
is_member(element, _) = False

check([], list) = True
check(list, list2) =
	if is_member(head(list), list2)
		then check(tail(list), list2)
		else False

check2(list, list2) =
	foldl (&&) True (map(\element -> element `elem` list2) list)

check3(list, list2) =
	foldl (&&) True (map(\element -> is_member(element, list2)) list)


-- Zadanie 4.
-- Napisać definicję funkcji liczbaw(e,l), której wartością jest liczba wystąpień elementu e na
-- liście l.
liczbaw(e, l) = foldl (+) 0 (map (\element -> if(e==element) then 1 else 0) l)



-- Zadanie 5.
-- Zdefiniować funkcji sprawdzającą równość dwóch list.
-- (\l1 l2 -> foldl (&&) (length(l1) == length(l2)) (map(\n -> l1!!n == l2!!n) [0..length(l1)-1]) ) "abc" "abc"

rownosc(list1, list2) = if(foldl (+) 0 (map (\element -> if(element `elem` list2) then 1 else 0) list1) == length(list2)) then True else False

rownosc2([],[]) = True
rownosc2([],_) = False
rownosc2(list1, list2) =
	if(head(list1) == head(list2))
		then rownosc2(tail(list1), tail(list2))
		else False

-- Zadanie 6.
-- Wykorzystać lambda wyrażenia do podniesienia do drugiej potęgi wszystkich elementów listy
-- liczbowej.
potega(list) = map (\element -> element^2) list


-- Zadanie 7.
-- Wykorzystać lambda wyrażenia do sprawdzenia podzielności liczby x przez y.
-- (\x y -> any (\i -> i == y) [i | i <- [1 .. x], mod x i == 0] ) 20 4

podzielnosc = \x -> \y -> mod x y == 0
