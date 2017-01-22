-- function n
--    | n == 1 = ...
--    | n == 2 = ...
--    | n >= 3 = ...
-- otherwise to do check

-- a) obliczającą silnię (n!) (definicja rekurencyjna)
silnia(0) = 1
silnia(n) = n * silnia(n-1)

silnia2(n) = foldl (*) 1 [1..n]
-- -----------------------------------------------------

-- b) obliczającą potęgę a n (a≠0, n e N) (definicja rekurencyjna)
potega(a,n) = foldl (*) 1 (map (\el -> a) [1..n])

potegaRek(a,0) = 1
potegaRek(a,1) = a
potegaRek(a,n) = a * potega(a,n-1)
-- -----------------------------------------------------

-- c) zwracającą przedostatni element listy
przedostatni(list) =
	let len = length list
	in list!!(len-2)

przedostatni2(list) = list!!(length list - 2)
-- -----------------------------------------------------

-- d) zwracającą drugi element listy
drugi(list)
	| length list > 1
		= last (take 2 list) -- dwa pierwsze elementy i bierzemy ostatni

drugi2(list) = list!!1 -- drugi element

drugi3(list)
	| length list > 1
		= head (drop 1 list) -- odrzucamy pierwszy element i bierzemy glowe

drugi4(list)
	| length list > 1
		= head (tail list) -- bierzemy ogon i z niego glowe

drugi5(list) = last (take 2 list)
-- -----------------------------------------------------

-- e) przestawiającą elementy listy w odwrotnym porządku (bez użycia reverse)
odwrocRek ([x]) = [x]
odwrocRek (list) =
	odwroc(tail(list)) ++ [head(list)]

odwr ([]) = []
odwr (g:o) =
	odwr(o) ++ [g]

odwroc(list) = map (\index -> list !! (length(list)-index)) [1..length(list)]
-- -----------------------------------------------------

-- f) przestawiającą w liście ostatni element z pierwszym
zamien(list) = map (\id -> list!!id) ([length(list)-1] ++ [1..length(list)-2] ++ [0])

zamien2([x])=[x]
zamien2(list)=
	[last(list)] ++ tail(init(list)) ++ [head(list)]
-- -----------------------------------------------------

-- g) obliczającą liczbę dodatnich elementów listy liczbowej
dodatni(x) =
	if x>0
		then 1
		else 0
liczDodatnie(lista) = foldl (+) 0 (map (\id -> dodatni(lista!!id)) [0..length(lista)-1])

liczDodatnie2(lista) =
	foldl (+) 0 (map
					(\id -> if(lista!!id > 0)
								then 1
								else 0)

					[0 .. length(lista)-1]
				)

liczDodatnieRek ([]) = 0
liczDodatnieRek (glowa:ogon) =
	if glowa > 0
		then 1 + liczDodatnie(ogon)
		else 0 + liczDodatnie(ogon)
-- -----------------------------------------------------

-- h) sprawdzającą, czy lista ma parzystą, czy nieparzystą liczbę elementów
sprawdz :: [Integer] -> [Char]
sprawdz(lista) =
	if (mod (length lista) 2 == 0)
		then "parzysta"
		else "nieparzysta"

sprawdzMap(list)=
	if(mod (foldl (+) 0 (map (\id -> 1) list)) 2 == 0)
		then "parzysta"
		else "nieparzysta"


-- -- implementacja length w rachunku lambda
lengthMetoda(list) =
	foldl (+) 0 (map (\id -> 1) list)
-- -----------------------------------------------------
