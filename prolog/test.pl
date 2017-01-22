is_member(X, [X|_]).
is_member(X, [_|Y]):-
	is_member(X,Y).

poczatek([], Lista).
poczatek([Head|Tail1], [Head|Tail2]):-
	poczatek(Tail1, Tail2).

ostatni(X, [X]).
ostatni(X, [_|Y]):-
	ostatni(X,Y).

rosnacy([]).
rosnacy([X]).
rosnacy([X|Y]):-
	[HeadT|TailT] = Y,
	X < HeadT,
	rosnacy(Y).

% IMPORTANT
max([Max], Max).
max([Head|Tail],Max):-
	max(Tail, TempMax),
	Head > TempMax,
	Max is Head.

max([Head|Tail],Max):-
	max(Tail, TempMax),
	Head < TempMax,
	Max is TempMax.
% ----------------------------------

znajdz([H|T], 1, H).
znajdz([H|T], ID, Element):-
	TempID is ID - 1, % IMPORTANT is instead of =
	znajdz(T, TempID, Element).

odwracanie([],[]).
odwracanie([H|T], Reversed):-
	odwracanie(T, TempReversed),
	append(TempReversed,[H], Reversed). % IMPORTANT

polacz([],L,L).
polacz(L1,L2,L3):-
	[HeadResult | TailResult] = L3,
	[HeadResult | Tail] = L1,
	polacz(Tail, L2, TailResult).

% zasada idz do konca i od konca wrzucaj pokolei następne głowy
dlugosc([], 0).
dlugosc([X], 1).
dlugosc([H|T], X):-
	dlugosc(T, X1),
	X is X1 + 1. %HERE

suma([],0).
suma([X],X).
suma([H|T], Sum):-
	suma(T, TempSum),
	Sum is TempSum + H. %HERE

nty([Head|_], 1, Head).
nty([_|Tail], ID, Head) :-
	nty(Tail, TempID, Head),
	ID is TempID + 1.
