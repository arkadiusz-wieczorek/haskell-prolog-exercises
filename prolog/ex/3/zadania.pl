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

% -------------------------------------------
is_member(X,[X|_]).

is_member(X,[_|Y]):-
	is_member(X, Y).

% -------------------------------------------

czesc_wspolna([],X,[]).
czesc_wspolna(Lista1, Lista2, [HeadResult | TailResult]):-
	[Head1 | Tail1] = Lista1,
	Head1 = HeadResult,
	is_member(Head1, Lista2), !,
	czesc_wspolna(Tail1, Lista2, TailResult).

czesc_wspolna(Lista1, Lista2, [HeadResult | TailResult]):-
	[Head1 | Tail1] = Lista1,
	czesc_wspolna(Tail1, Lista2, [HeadResult | TailResult]).
% -------------------------------------------

suma_zb([],X,X).

suma_zb(Lista1, Lista2, [HeadResult | TailResult]):-
	[Head1 | Tail1] = Lista1,
	[Head2 | Tail2] = Lista2,
	Head1 = HeadResult,
	not(is_member(Head1, Lista2)), !,
	suma_zb(Tail1, Lista2, TailResult).

suma_zb(Lista1, Lista2, [HeadResult | TailResult]):-
	[Head1 | Tail1] = Lista1,
	suma_zb(Tail1, Lista2, [HeadResult | TailResult]).

% -------------------------------------------

suma_zb2([],X,X).
suma_zb2( [ Glowa1 | Ogon1 ], Lista2, Suma ):-
	is_member(Glowa1,Lista2),!,
	suma_zb2(Ogon1,Lista2,Suma).
suma_zb2( [ Glowa1 | Ogon1 ], Lista2, [ Glowa1 | OgonWynik ] ):-
	suma_zb2(Ogon1,Lista2,OgonWynik).

% -------------------------------------------

roznica(X,[],X).
roznica([],X,[]).

roznica(Lista1, Lista2, ListaWynik):-
	[Head1 | Tail1] = Lista1,
	[HeadResult | TailResult] = ListaWynik,
	Head1 = HeadResult,
	not(is_member(Head1, Lista2)), !,
	roznica(Tail1, Lista2, TailResult).

roznica(Lista1, Lista2, ListaWynik):-
	[Head1 | Tail1] = Lista1,
	roznica(Tail1, Lista2, ListaWynik).


% --------------------------------------------
