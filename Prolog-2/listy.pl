odwracanie([],[]).
odwracanie([A|B], Reversed):-
	odwracanie(B, TempReversed),
	append(TempReversed, [A], Reversed).


polacz([],L,L).
polacz([L1_Head|L1_Tail],L2,[L1_Head|L3]):-
	polacz(L1_Tail,L2,L3).


dlugosc([],0).
dlugosc([L_Head|L_Tail],N):-
	dlugosc(L_Tail, N1),
	N is N1+1.

suma([],0).
suma([L_Head|L_Tail], N):-
	suma(L_Tail, N1),
	N is N1 + L_Head.


pisz([]).
pisz([X|Y]):-
	length([X|Y],N)
		write(X),
		nl,
		pisz(Y);
		pisz(Y).


% co_drugi_element([L_Head|L_Tail],N):-
% 	N is N1+1,
% 	(N mod 2):-
% 		write(L_Head);
% 		write("nope"),
% 	co_drugi_element(L_Tail, N1).
