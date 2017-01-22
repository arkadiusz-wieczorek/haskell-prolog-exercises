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
