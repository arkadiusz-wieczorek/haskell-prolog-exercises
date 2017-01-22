-- Zadanie 1.
-- Zdefiniuj funkcję sqrlist podnoszącą do kwadratu wszystkie elementy danej listy liczb
-- całkowitych, np. sqrlist[1,2,-3] zwraca [1; 4; 9].
-- a) z użyciem map,
-- b) w definicji sqrlist nie należy używać map.

sqrlist(list) = map (\id -> ((list!!id) * (list!!id)) ) [0..length(list)-1]

sqrlist2([x]) = [x*x]
sqrlist2(g:o) = [g*g] ++ sqrlist2(o)

sqrlist3(list) = map (\el -> el^2) list

-- Zadanie 2.
-- Zdefiniuj polimorficzną funkcję count obliczającą, ile razy dany obiekt występuje w danej
-- liście, np. count('a', ['a', 'l', 'a']) zwraca 2. Jaki jest typ tej funkcji?

count(element, list) = foldl (+) 0 (map (\id -> if (list!!id == element)
												then 1
												else 0) [0..length(list)-1])

zlicz(element,list) = foldl (+) 0 (map (\e -> if e == element
												then 1
												else 0) list)

-- Zadanie 3.
-- Zdefiniuj polimorficzną funkcję duplicate powtarzającą dany obiekt określoną liczbę razy
-- i zwracającą wynik w postaci listy, np. duplicate("pf",3) zwraca ["pf","pf","pf"]. Jaki jest typ
-- tej funkcji?
duplicate(element, how_many) = map (\id -> element) [0..how_many-1]


-- Zadanie 4.
-- Zdefiniuj polimorficzną funkcję palindrome sprawdzającą, czy dana lista jest palindromem,
-- tj. równa się sobie samej przy odwróconej kolejności elementów.

-- 2,1,2
-- 2,2

palindrome(list) = if (reverse(list) == list)
						then True
						else False


rev(list) = map (\id -> list!!id) [(length(list)-1), (length(list)-2)..0]

palindrome2(list) = if (rev(list) == list)
						then True
						else False


-- Zadanie 5.
-- Zdefiniuj polimorficzną funkcję select usuwającą pierwsze wystąpienie danego elementu
-- w liście.
-- select(3,[2,3,4,3])
select (x, []) = []
select (x, list) = 	if (x == head(list))
						then tail(list)
						else [head(list)] ++ select(x, tail(list))


--  usuwanie wszystkich
select2 (x, list) = filter (\el -> el /= x) list


-- Zadanie 6.
-- Zdefiniuj polimorficzną funkcję delnth usuwającą element na n-tym miejscu w liście.
-- delnth (n, list) = map (\id > if)
-- delnth(2,[0,2,3,4,2])

delnth (n, list) = map (\id -> list!!id ) (filter (\id -> id /=n) [0..length(list)-1])


-- Zadanie 7.
-- Zdefiniuj polimorficzną funkcję prefix sprawdzającą, czy lista dana jako pierwszy argument
-- funkcji jest początkiem listy – drugiego argumentu funkcji.

-- prefix([],[]) = True
prefix([], [_]) = True
prefix(list, list2) = if head(list) == head(list2)
	then prefix(tail(list), tail(list2))
	else False


-- Zadanie 8.
-- Napisać funkcję rekurencyjną suma-n, której wartością jest suma liczb od 1 do n.

suma_n(0) = 0
suma_n(n) = n + suma_n(n-1)






-- Zadanie 9.
-- Zaproponować wersję „akumulatorową” rozwiązania zadania 7.

prefixPOM(x, y) = if(x==y) then True else False

prefix2([], [_]) = True
prefix2(list, list2) = if prefixPOM(head(list), head(list2))
		then prefixPOM(head(tail(list)), head(tail(list2)))
		else False
-- ????????????????????????????????

-- Zadanie 10.
-- Napisać wersję „akumulatorową” funkcji obliczającej potęgę a n (a≠0, neN)

silnia(n) = silniaPOM(n, 1)
silniaPOM(n, x) =
	if n== 0
		then x
		else silniaPOM ((n-1), (n*x))


-- 5 → (n=5, x=1) → else → (n=5-1, 5*1)
-- 4 → (n=4, x=5) → else → (n=4-1, 4*5)
-- 3 → (n=3, x=20) → else → (n=3-1, 3*20)
-- 2 → (n=2, x=60) → else → (n=2-1, 2*60)
-- 1 → (n=1, x=120) → else → (n=1-1, 1*120)
-- 1 → (n=0, x=120) → then 120

-- potega(1,n) = 1
-- potega(a,0) = 1
-- potega(a,n) = a * potega(a,n-1)


-- a*a*a*a

potega(a,n) = potegaPOM(a,n)
potegaPOM(a,n) =
	if (n==1)
		then a
		else potegaPOM((a*a), (n-1))
-- ????????????????????????????
