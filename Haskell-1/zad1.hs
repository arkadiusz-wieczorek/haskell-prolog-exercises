-- Napisz funkcję w Haskellu:
-- a) obliczającą silnię (n!) (definicja rekurencyjna)
-- b) obliczającą potęgę a n (a≠0, n e N) (definicja rekurencyjna)
-- c) zwracającą przedostatni element listy
-- d) zwracającą drugi element listy

-- function n
--    | n == 1 = ...
--    | n == 2 = ...
--    | n >= 3 = ...


-- odp a
silnia(0) = 1
silnia(1) = 1
silnia(n) = n * silnia(n-1)

-- potega(a,n)
-- 	| a == 0 = 0
-- 	| a /= 0 = a*potega(a,n-1)

-- odp b
potega(a,0) = 1
potega(a,1) = a
potega(0,n) = 0
potega(1,n) = 1

potega(a,n) =
	a*potega(a,n-1)


-- odp c
przedostatni(list) =
	let len = length list
	in list!!(len-2)

przedostatni2(list) =
	list!!(length list - 2)

-- odp d
drugi(list)
	| length list > 1
		= last (take 2 list) -- dwa pierwsze elementy i bierzemy ostatni

drugi2(list) =
	list!!1 -- drugi element

drugi3(list)
	| length list > 1
		= head (drop 1 list) -- odrzucamy pierwszy element i bierzemy glowe

drugi4(list)
	| length list > 1
		= head (tail list) -- bierzemy ogon i z niego glowe
