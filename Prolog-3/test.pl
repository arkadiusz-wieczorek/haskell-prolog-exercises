poczatek([],X).
poczatek([H1|T1], [H2|T2]) :-
	H1 = H2,
	poczatek(T1,T2).

ostatni([H],H).
ostatni([H|T],Last):-
	ostatni(T,Last).

% nty(X,[X|_],1).
% nty(X,[_|T],N) :-
% 	nty(X,T,N1),
% 	N is N1+1.

nty(X,[X|T],1).
nty(X, Lista, N):-
	[Head|Tail] = Lista,
	nty(X,Tail, N1),
	N is N1 + 1.

nalezy_do_listy(X,[X|_]).
nalezy_do_listy(X,[_|Y]):-
	nalezy_do_listy(X,Y).

podzbior([],Y).
podzbior([A|X],Y):-
	nalezy_do_listy(A,Y),
	podzbior(X,Y).
