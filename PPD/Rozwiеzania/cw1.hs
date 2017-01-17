pow::(Int,Int)->Int
pow(a,n) = if n==0 then 1
               else a*pow(a, n-1)

nwd::(Float,Float)->Float
nwd(a,b) = if a==b then a 
                          else if a>b then nwd(a-b,b)
                          else nwd(a,b-a)

nww::(Float,Float)->Float
nww(a,b) = a/nwd(a,b)*b

fib::Int->Int
fib(n) = if n<3 then 1
			else fib(n-2)+fib(n-1)

tri::(Float,Float, Float)->Bool
tri(a,b,c) = if a+b>c && a+c>b && b+c>a then True
		else False
 
 