

suma(X, Y, Z) :- Z is X + Y.

odwracanie([],[]).
odwracanie([Glowa|Ogon],Wynik) :-
	odwracanie(Ogon,D),
	append(D,[Glowa],Wynik).


jest_lista([]).
jest_lista([X|Y]).


znajdz([X|T], 0, X).
znajdz([X|H], Index, Result) :-
	NewIndex is Index - 1,
	znajdz(H, NewIndex, Result).


nty(X,[X|_],1).
nty(X,[_|T],N) :-
	nty(X,T,N1),
	N is N1+1.

nty2(X,[X|T],1).
nty2(X, Lista, N):-
	[Head|Tail] = Lista,
	nty(X,Tail, N1),
	N is N1 + 1.
