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


czesc_wspolna([],X,[]).
czesc_wspolna([X|R],Y,[X|Z]):-
	nalezy_do_listy(X,Y),
	!,
	czesc_wspolna(R,Y,Z).
czesc_wspolna([X|R],Y,Z):-
	czesc_wspolna(R,Y,Z).


suma_elementow_list([X],[Y],[Z]):-
	Z is X+Y.
suma_elementow_list([HeadX|TailX],[HeadY|TailY],[HeadZ|TailZ]):-
	HeadZ is HeadX + HeadY,
	suma_elementow_list(TailX, TailY, TailZ).


% add_matrices([Head_X,Sub_X|[Tail_X]],[Head_Y,Sub_Y|[Tail_Y]],Result):-
% 	suma_elementow_list(Head_X, Head_Y, Temp),
% 	suma_elementow_list(Sub_X, Sub_Y, Temp2),
% 	append(Temp, Temp2, Temp_result),
% 	write(Temp_result),
% 	add_matrices(Tail_X, Tail_Y, Temp_result).

% add_matrices([[X]],[[Y]],[[Z]]):-
% 	Z is X+Y.
%
% add_matrices([[]],[[]],[[]]).
%
% add_matrices(Mat_X, Mat_Y, Mat_Z):-
% 	[Head_X|Tail_X] = Mat_X,
% 	[Head_Y|Tail_Y] = Mat_Y,
% 	suma_elementow_list(Head_X, Head_Y, Head_Z),
% 	append([Head_Z], Mat_Z, Result),
% 	write(Result),
% 	add_matrices(Tail_X, Tail_Y, Result).


% add_matrices([ [2,3],[2,3] ], [ [3,4],[3,5] ], Z).
