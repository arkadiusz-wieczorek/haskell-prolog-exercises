--zad1
powerlist [] = [[]]
powerlist (h:t) = [h:y | y <- powerlist t] ++ powerlist t

--zad2
podzbior [] l2 = True
podzbior (h:t) l2 = if (elem h l2 == True) then podzbior t l2
                                           else False 

--zad3
iloczyn l1 [] = []
iloczyn [] l2 = []
iloczyn (h:t) l2 = if (elem h l2 == True) then h : (iloczyn t l2)
	                                      else (iloczyn t l2)

--zad4
myFoldr f x [] = x
myFoldr f x (h:t) = f h (myFoldr f x t)
--Przyklady:
--myFoldr (-) 10 [10,20,30]
--myFoldr (/) 10 [10,20,30]
--myFoldr (mod) 100 [1,2,5]

--zad5
myFoldl f x [] = x
myFoldl f x (h:t) = myFoldl f (f x h) t
--Przyklady:
--myFoldl (+) 10 [10,20,30]
--myFoldl (\x y -> (x + y)*10) 100 [1,2,5]
--myFoldl (*) 10 [10,20,30]

--zad6
zwielokrotnij = \a b -> (a+b)*10
--zwielokrotnij 2 3
pomnoz = \a b -> a*b
--pomnoz 10 2
podziel = \a b -> a/b
--podziel 20 5
reszta = \a b -> a mod b
--reszta 20 8
polacz = \a b -> a ++ b
--polacz "aaa" "bbb"
uniwersalna f = \a b -> f a b
--uniwersalna (+) 5 6