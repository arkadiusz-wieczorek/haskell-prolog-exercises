
element([],[]).
element(X, [G|O]):-
	X is G;
	element(X, O).


% element(X,[X|_]).
% element(X,[_|Ogon]):-
% 	element(X,Ogon).



% -początek([1,3], [1,3,2,4,3]).
% true.
% ?-początek([3,1], [1,3,2,4,3]).
% false.

% poczatek(X,[X|Reszta]).
% poczatek([],X).
% poczatek([X_glowa | X_ogon], [X_glowa |Y_ogon]):-
% 	write('X_glowa '),
% 	write(X_glowa),
% 	nl,
% 	write('X_ogon '),
% 	write(X_ogon),
% 	nl,
% 	write('Y_ogon '),
% 	write(Y_ogon),
% 	nl,
% 	poczatek(X_ogon, Y_ogon).


% poczatek(X,[X|Reszta]).
% poczatek([],X).
% poczatek([X_glowa | X_ogon], [X_glowa | Y_ogon]):-
% 	poczatek(X_glowa, Y_ogon).
%




poczatek(H, [H|T]).
poczatek([], [H|T]).
poczatek([H], [H|T]).

poczatek(Lista, [H|T]):-
	[L_H|L_T] = Lista,
	L_H is H,
	poczatek(L_T, T).


ostatni([Element],Element).
ostatni([X_glowa|X_ogon], Element):-
	ostatni(X_ogon, Element).


ostatni(X, Element):-
	reverse(X,[Y_head|Y_tail]),
	Y_head = Element.


% Zadanie 8.
% Zdefiniować predykat rosnacy który sprawdza, czy kolejne elementy listy L tworzą ciąg
% ściśle rosnący.
% ?-rosnący([3,6,7,12,29]).
% true.
% ?-rosnący([3,2,7,12,2]).
% false.

% rosnacy(L):-
% 	sort(L,X),
% 	L == X.

rosnacy([]).
rosnacy([X]).
rosnacy(X):-
	[Head|Tail] = X,
	[Head_Tail|Tail_Tail] = Tail,
	Head<Head_Tail,
	rosnacy(Tail).

%
% max(Lista, Max):-
% 	sort(Lista, Sorted),
% 	reverse(Sorted, Reversed),
% 	[Head|Tail] = Reversed,
% 	Max == Head.



% max(Lista, Max):-
% 	[Head|Tail] = Lista,
% 	[Head_Tail|Tail_Tail] = Tail,
% 	( Head >= Head_Tail
% 		-> Max=Head
% 		; Max=Head_Tail
% 	),
% 	max(Tail, Max).



max([Max], Max).
max([H|T], Max) :-
    max(T, Temp_Max),
    (H > Temp_Max
    ->
        Max = H
	;
        Max = Temp_Max
    ).



% ?-znajdz([i,n,f,o,r,m,a,t,y,k,a],4,M).
% M=o.


znajdz([Head|Tail], 1, Head).
znajdz([Head|Tail], ID, Element):-
	Temp_ID is ID-1,
	znajdz(Tail, Temp_ID, Element).
%
%
% element([],[]).
% element(X, [G|O]):-
% 	X is G;
% 	element(X, O).
%
%
% dlugosc([],0).
% dlugosc([L_Head|L_Tail],N):-
% 	dlugosc(L_Tail, N1),
% 	N is N1+1.
