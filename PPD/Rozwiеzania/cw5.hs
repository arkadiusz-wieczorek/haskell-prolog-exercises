--zad1
data Moto = Opel | Seat | Renault | Fiat | Ford
	 deriving (Show, Eq)

type Kraj = [Char]

--a (sposob  z alternatywa)
panstwo :: Kraj -> Moto
panstwo x | x == "Niemcy"			= Opel
	      | x == "Wielka Brytania"	= Seat
	      | x == "Francja"			= Renault
	      | x == "Włochy"			= Fiat
	      | x == "USA"				= Ford

--b (sposob z case of)
srednia_predkosc :: Moto -> Int
srednia_predkosc x = case x of
								Opel -> 200
								Seat -> 210
								Renault -> 220
								Fiat -> 230
								Ford -> 240


--zad2
data Tree tree = Empty | Node tree (Tree tree) (Tree tree)
	 deriving (Show)

depth:: Tree tree -> Int
depth Empty = 0
depth (Node _ left right) = 1 + max (depth left) (depth right)

preorder:: Tree tree -> [tree]
preorder Empty = []
preorder (Node tree left right) = [tree] ++ preorder left ++ preorder right

postorder:: Tree tree -> [tree]
postorder Empty = []
postorder (Node tree left right) = postorder left ++ postorder right ++ [tree]

inorder:: Tree tree -> [tree]
inorder Empty = []
inorder (Node tree left right) = inorder left ++ [tree] ++ inorder right

a = Node 1 (Node 2 (Node 4 Empty Empty)(Node 5 Empty (Node 8 Empty Empty)))(Node 3 (Node 6 Empty (Node 9 Empty Empty))(Node 7 Empty Empty))
b = Node 'a'(Node 'b' Empty (Node 'd' (Node 'f' Empty Empty) Empty))(Node 'c' (Node 'e' Empty (Node 'g' Empty Empty)) Empty)

--SPOSOB DZIALANIA
-- preorder a
-- [1,2,4,5,8,3,6,9,7]

-- inorder a
-- [4,2,5,8,1,6,9,3,7]

-- postorder a
-- [4,8,5,2,9,6,7,3,1]

-- preorder b
-- "abdfceg"

-- inorder b
-- "bfdaegc"

-- postorder b
--"fdbgeca"


--Zad3
tree_member_pre (Empty, _) = False
tree_member_pre (Node a left right, x) = (a == x) || tree_member_pre(left, x) || tree_member_pre(right, x)

tree_member_post (Empty, _) = False
tree_member_post (Node a left right, x) = tree_member_post(left, x) || tree_member_post(right, x) || (a == x)

tree_member_in (Empty, _) = False
tree_member_in (Node a left right, x) = tree_member_in(left, x) || (a == x) || tree_member_in(right, x)

--Zad4
bfs x = fs [x]
    	where
        	fs [] = []
        	fs xs = map value xs ++ fs (concat (map leftright xs))
        	value (Node a _ _) = a
       	 	leftright (Node _ Empty Empty) = []
        	leftright (Node _ Empty b)     = [b]
        	leftright (Node _ a Empty)     = [a]
        	leftright (Node _ a b)         = [a,b]