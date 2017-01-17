--zad1
(>>^) f g = f >>= return
            g >>= return

--zad2
dwie_liczby = do 
				putStr "Podaj A: "
				a <- getLine
				let x = read a
				putStr "Podaj B: "
				b <- getLine
				let y = read b
				putStr ("SUMA = " ++ show (x+y) ++ "\n")
				putStr ("ROZNICA = " ++ show (x-y) ++ "\n")
				putStr ("ILOCZYN = " ++ show (x*y) ++ "\n")

--zad3
firstLetter (x:xs) = return x

inicjaly = do
				putStr "Podaj imie: "
				a <- getLine
				putStr "Podaj nazwisko: "
				b <- getLine	
				putStr ("INICJALY: " ++ firstLetter a ++ "." ++ firstLetter b ++ ".")

--zad4
class Adres a where
      mail :: a -> String -> Bool

data Email = String
instance Adres Email where
         mail a "@st.amu.edu.pl" = True
         mail _ _ = False
