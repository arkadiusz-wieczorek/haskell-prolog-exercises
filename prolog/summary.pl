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
dlugosc([H|T], X):-
	dlugosc(T, X1),
	X is X1 + 1. %HERE

suma([],0).
suma([H|T], Sum):-
	suma(T, TempSum),
	Sum is TempSum + H. %HERE

nty([Head|_], 1, Head).
nty([_|Tail], ID, Head) :-
	nty(Tail, TempID, Head),
	ID is TempID + 1.

% ----------------------------------
%  ZBIORY

is_member(X, [X]).
is_member(X, [_|Y]):-
	is_member(X,Y).
% ----------------------------------
czesc_wspolna([], L, []).

czesc_wspolna(L1, L2, LR):-
	[Head|Tail] = L1,
	[HeadR | TailR] = LR,
	HeadR is Head,
	is_member(Head, L2), !,
	czesc_wspolna(Tail, L2, TailR).

czesc_wspolna(L1, L2, LR):-
	[Head|Tail] = L1,
	czesc_wspolna(Tail, L2, LR).

% ----------------------------------

podzbior([], L2).
podzbior(L1, L2):-
	[Head | Tail] = L1,
	is_member(Head, L2),
	podzbior(Tail, L2).

% ----------------------------------
roznica([], L2, []).

roznica(L1, L2, LR):-
	[Head1 | Tail1] = L1,
	[HeadR | TailR] = LR,
	HeadR is Head1,
	not(is_member(Head1, L2)), !,
	roznica(Tail1, L2, TailR).

roznica(L1, L2, LR):-
	[Head | Tail] = L1,
	roznica(Tail, L2, LR).
% ----------------------------------

suma_zbiorow([], L2, L2).

suma_zbiorow(L1, L2, LR):-
	[Head | Tail] = L1,
	[HeadR | TailR] = LR,
	HeadR is Head,
	not(is_member(Head, L2)), !,
	suma_zbiorow(Tail, L2, TailR).

suma_zbiorow(L1, L2, LR):-
	[Head | Tail] = L1,
	suma_zbiorow(Tail, L2, LR).
% ----------------------------------
% dodawanie macierzy

addRow([],[],[]).

addRow([X], [Y], [Z]):-
	Z is X+Y.

addRow([Head|Tail], [Head2|Tail2], [HeadResult|TailResult]):-
	HeadResult is Head+Head2,
	addRow(Tail, Tail2, TailResult).


addMatrices([],[],[]).

addMatrices( [Head|Tail], [Head2|Tail2], [HeadResult|TailResult]):-
	addRow(Head, Head2, HeadResult),!,
	addMatrices(Tail, Tail2, TailResult).
% ----------------------------------
%
test([X|Y], 1, X).
test([X|Y], ID, Element) :-
	test(Y, TempID, Element),
	ID is TempID + 1.
