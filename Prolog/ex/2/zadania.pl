% Czy X należy do listy?
element([],[]).
element(X, [G|O]):-
	X is G;
	element(X, O).

element(X, [X]).
element(X, [G|O]) :-
	G==X; element(X, O).

element2(X, [X|Y]).
element2(X, [G|O]) :- element2(X, O).


is_member(X,[X|_]).

is_member(X,[_|Y]):-
	is_member(X, Y).

% -----------------------------------------------------

poczatek(H, [H|T]).
poczatek([], [H|T]).
poczatek([H], [H|T]).

poczatek(Lista, [H|T]):-
	[L_H|L_T] = Lista,
	L_H is H,
	poczatek(L_T, T).

% --------------

poczatek2([], [G|O]).
poczatek2([Head|Tail1], [Head|Tail2]) :- poczatek2(Tail1, Tail2).

% --------------
poczatek3([X], [X|O]).
poczatek3(Lista, Lista2):-
	[Head|Tail] = Lista,
	[Head2|Tail2] = Lista2,
	Head == Head2,
	poczatek3(Tail,Tail2).


% --------------
ostatni([Ost], Ost).
ostatni([Head|Tail], Element):-
	ostatni(Tail, Element).

ostatni2(X, Element):-
	reverse(X,[Y_head|Y_tail]),
	Y_head = Element.

rosnacy([]).
rosnacy([X]).
rosnacy(X):-
	[Head|Tail] = X,
	[Head_Tail|Tail_Tail] = Tail,
	Head<Head_Tail,
	rosnacy(Tail).
% --------------

rosnacy2([Jeden]).
rosnacy2([Head|[Head2|Tail2]]):-
	Head<Head2,
	rosnacy2(Tail).

% --------------
max([Max], Max).
max([H|T], Max) :-
    max(T, Temp_Max),
    (H > Temp_Max
    ->
        Max = H
	;
        Max = Temp_Max
    ).
% --------------
max2([X], X).
max2([H|T], X) :- max2(T, X1), X1 > H, X is X1.
max2([H|T], X) :- max2(T, X1), X1 < H, X is H.

% --------------

wiekszy(X,X,X).
wiekszy(X,Y,MAX) :-
	(X > Y , MAX = X ) ; (Y > X, MAX = Y).

max3([X], X).
max3([G|O], Max) :-
	max3(O, Max_ogon),
	wiekszy(Max_ogon, G, Max).
% --------------
max4(Lista, Max):-
	sort(Lista, Sorted),
	reverse(Sorted, Reversed),
	[Head|Tail] = Reversed,
	Max == Head.

% ?-znajdz([i,n,f,o,r,m,a,t,y,k,a],4,M).
% M=o.


znajdz([Head|Tail], 1, Head).
znajdz([Head|Tail], ID, Element):-
	Temp_ID is ID-1,
	znajdz(Tail, Temp_ID, Element).


odwracanie([],[]).
odwracanie([A|B], Reversed):-
	odwracanie(B, TempReversed),
	append(TempReversed, [A], Reversed).

polacz([],L,L).
polacz( [L1_Head | L1_Tail ], L2, [ L1_Head|L3 ]):-
	polacz(L1_Tail,L2,L3).

dlugosc([],0).
dlugosc([L_Head|L_Tail],N):-
	dlugosc(L_Tail, N1),
	N is N1+1.

suma([],0).
suma([L_Head|L_Tail], N):-
	suma(L_Tail, N1),
	N is N1 + L_Head.
