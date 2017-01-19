-- e) przestawiającą elementy listy w odwrotnym porządku (bez użycia reverse)
-- f) przestawiającą w liście ostatni element z pierwszym
-- g) obliczającą liczbę dodatnich elementów listy liczbowej
-- h) sprawdzającą, czy lista ma parzystą, czy nieparzystą liczbę elementów

-- odp e

odwroc([x])=[x]
odwroc(list)=
	odwroc(tail(list)) ++ [head(list)]



reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]


-- odp f
zamien([x])=[x]
zamien(list)=
	[last(list)] ++ tail(init(list)) ++ [head(list)]


-- odp g
-- suma []     = 0
-- suma (glowa:ogon) = glowa + suma(ogon)

liczDodatnie ([]) = 0
liczDodatnie (glowa:ogon) =
	if glowa > 0
		then 1 + liczDodatnie(ogon)
		else 0 + liczDodatnie(ogon)

-- h) sprawdzającą, czy lista ma parzystą, czy nieparzystą liczbę elementów
-- odp h

sprawdz :: [Integer] -> [Char]
sprawdz(lista)=
	if length lista mod 2 == 0
		then "parzysta"
		else "nieparzysta"
