map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (h:xs) = 	(f h) : (map f xs)

filter f [] = []
filter f (h:xs) =
	if f h
		then h : filter f xs
		else filter f xs

quicksort (x:xs) =
	quicksort (filter (<x) xs) ++ [x] ++ quicksort (filter (>=x) xs)

fib (n) =
	if n == 0 then 1
			  else if n == 1
				  		then 1
						else fib (n-1) + fib (n-2)
-- --------------------------------

-- 1. Silnia rekurencyjnie
silnia(0) = 1
silnia(n) = n * silnia (n-1)

-- 2. Potęga rekurencyjnie
potega(a,0) = 1
potega(a,1) = a
potega(a,n) = a * potega(a, n-1)

-- 3. zwracającą przedostatni element listy
przedostatni(list) =
	list!!(length(list)-2)

-- 4. zwracającą drugi element listy
drugi(list) = list!!1

-- 5. przestawiającą elementy listy w odwrotnym porządku (bez użycia reverse)
odwroc(list) = map (\id -> list!!id) [(length(list)-1),(length(list)-2)..0]

-- 6. przestawiającą w liście ostatni element z pierwszym
przestaw(list) = if(length(list)>1) then map (\id -> list!!id) ([length(list)-1]++[1..length(list)-2]++[0]) else list

-- 7. obliczającą liczbę dodatnich elementów listy liczbowej
liczba_dodatnich(list) = foldl (+) 0 (map (\element -> if(element > 0) then 1 else 0) list)

-- 8. sprawdzającą, czy lista ma parzystą, czy nieparzystą liczbę elementów
czy_parzysta :: [t] -> [Char]
czy_parzysta(list) =
	if (mod (length(list)) 2 == 0)
		then "parzysta"
		else "nieparzysta"

-- 9. implementacja length w rachunku lambda
lengthMetoda(list) = foldl (+) 0 (map (\id -> 1) list)

-- 10. Zdefiniuj funkcję sqrlist podnoszącą do kwadratu wszystkie elementy danej listy liczb
-- całkowitych, np. sqrlist[1,2,-3] zwraca [1; 4; 9].
-- z map
kwadrat(list) = map (\element -> element^2) list

-- rekurencyjnie
kwadratRek([]) = []
kwadratRek(g:o) = [g^2] ++ kwadratRek(o)


-- 11. Zdefiniuj polimorficzną funkcję count obliczającą, ile razy dany obiekt występuje w danej
-- liście, np. count('a', ['a', 'l', 'a']) zwraca 2. Jaki jest typ tej funkcji?
count(el, list) = foldl (+) 0 (map (\element -> if(element == el) then 1 else 0) list)


-- 12. Zdefiniuj polimorficzną funkcję duplicate powtarzającą dany obiekt określoną liczbę razy
-- i zwracającą wynik w postaci listy, np. duplicate("pf",3) zwraca ["pf","pf","pf"]. Jaki jest typ
-- tej funkcji?
duplicate(el, how_many) = map (\i -> el) [0..(how_many-1)]


-- 13. Zdefiniuj polimorficzną funkcję palindrome sprawdzającą, czy dana lista jest palindromem,
-- tj. równa się sobie samej przy odwróconej kolejności elementów.
palindrome(list) =
	if list == map (\id -> list!!id) [(length(list)-1), (length(list)-2)..0]
		then True
		else False

-- 14. Zdefiniuj polimorficzną funkcję select usuwającą pierwsze wystąpienie danego elementu w liście.
select (el, []) = []
select (el, g:o) =
	if g == el
		then o
		else [g] ++ select(el, o)

select2 (x, []) = []
select2 (x, list) =
	if (x == head(list))
		then tail(list)
		else [head(list)] ++ select2(x, tail(list))

dwa_wyst (element, list) = select(element, select(element, list))


-- 15. Zdefiniuj polimorficzną funkcję delnth usuwającą element na n-tym miejscu w liście.
deln n list = take (n-1) list ++ drop n list

delnth (n, list) = (map (\id -> list!!id) [0..n-1]) ++ (map (\id -> list!!id) [n+1..(length(list)-1)])

-- z obsluga bledow
delnth2 (n, list) =
	if length(list) >= n
		then (map (\id -> list!!id) [0..n-1]) ++ (map (\id -> list!!id) [n+1..(length(list)-1)])
		else list

-- 16. Zdefiniuj polimorficzną funkcję prefix sprawdzającą, czy lista dana jako pierwszy argument
-- funkcji jest początkiem listy – drugiego argumentu funkcji.
prefix([],list) = True
prefix(list1, list2) =
	if head(list1) == head(list2)
		then prefix(tail(list1), tail(list2))
		else False


-- 17. Napisać funkcję rekurencyjną suma_n, której wartością jest suma liczb od 1 do n.
suma_n (1) = 1
suma_n (n) = n + suma_n(n-1)

-- nierekurencyjnie
suma_n2 (n) = foldl (+) 0 (map (\e -> e) [1..n])


-- 18,19 ???
-- Zaproponować wersję „akumulatorową” rozwiązania zadania 7.

-- 19. Napisać wersję „akumulatorową” funkcji obliczającej potęgę a n (a≠0, n  N)
power a n = powerPOM a n 1
powerPOM a n x = if n==0 then x
                         else powerPOM a (n-1) (x*a)


-- 20. Napisać definicję funkcji wstaw(n,l,e), której wartością jest nowa lista uzyskana przez
-- wstawienie do listy l elementu e na pozycję n.
wstaw(n, list, e) = (map (\id -> list!!id) [0..(n-1)]) ++ [e] ++ (drop (n) list)

-- 21. Napisać definicję funkcji usun(n,l), której wartością dla niepustej listy jest lista uzyskana
-- przez usunięcie n-tego elementu z listy l
usun(n, list) = map (\id -> list!!id) (filter (\id -> id /= n) [0..length(list)-1])

-- 22. Napisać definicję dwuargumentowej funkcji określonej dla list, której wartością jest prawda,
-- jeśli wszystkie elementy pierwszej listy występują na drugiej liście.
sprawdz(list1, list2) = foldl (&&) True (map (\el -> if(el `elem` list2) then True else False) list1)


-- 23. Napisać definicję funkcji liczbaw(e,l), której wartością jest liczba wystąpień elementu e na
-- liście l.
liczbaw(e, list) = foldl (+) 0 (map (\el -> if(e == el) then 1 else 0) list)


-- 24. Zdefiniować funkcji sprawdzającą równość dwóch list.
rownosc([],[]) = True
rownosc(list1, list2) =
	if length(list1) == length(list2)
		then
			if head(list1) == head(list2)
				then rownosc(tail(list1), tail(list2))
				else False
		else False

rownosc2(list1, list2) =
	if length(list1) == length(list2)
		then foldl (&&) True (map (\id -> if(list1!!id == list2!!id) then True else False) [0..length(list1)-1])
		else False


-- 25. Wykorzystać lambda wyrażenia do podniesienia do drugiej potęgi wszystkich elementów listy
-- liczbowej.
potega_lambda(list) = map (\el -> el^2) list


-- 26. Wykorzystać lambda wyrażenia do sprawdzenia podzielności liczby x przez y.
podzielnosc = (\x -> \y -> if((mod x y)==0) then True else False )
