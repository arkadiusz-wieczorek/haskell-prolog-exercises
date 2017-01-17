import Data.Char
import Data.List

--zad1
--błąd w zadaniu polegał na tym, używaliśmy w funkcji operatora porównania (==), a ten operator również jest funkcją. 
--Należy więc przekazać go do własnej funkcji poprzez prefiks 'Eq'. Wymusza to, iż wartość musi nalezeć do rodziny Eq
--dopisujemy: Eq a =>'
pustal :: Eq a => [a] -> Bool
pustal x = (x == [])

--zad2
--błąd w zadaniu polegał na tym, że Haskell oczekiwał w 'acc * 10', aby 'acc' było Int, a nie Char, 
--a także aby dodana do tego wartość 'x', była Char a, nie Int
--ponadto należało pomnożyć x * 10 a nie acc * 10, gdyż x, który jest następnikiem, jest o rządz dziesiątek większy i taką liczbę powinniśmy dodać
--zmieniamy miejsce 'digitToInt' oraz miejsce mnożenia * 10
naInt :: String -> Int 
naInt = foldl(\x acc -> (digitToInt acc) + x * 10) 0

--zad3
listaPar [] = []
listaPar (h:t) = [(h, length [x | x <-(h:t), x == h ])] ++ listaPar [y | y <- t, y /= h ]

--zad4
--dodajemy do krotki kwadrat odleglosci
pom [] =[]
pom ((x, y) : t) = [(x^2 + y^2, x, y)] ++ (pom t)

--usuwamy z krotek odleglosc
pom2[] = []
pom2 ((x, y, z) : t) = [(y, z)] ++ (pom2 t)

--laczymy calosc - sortujemy krotki wg odleglosci, a nastepnie z posortowanych krotek usuwamy odleglosc
f x = pom2 (sort (pom x))


