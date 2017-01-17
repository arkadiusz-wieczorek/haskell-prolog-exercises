% ojciec
ojciec(X,Y):-mezczyzna(X), rodzic(X,Y).

% matka
matka(X,Y):-kobieta(X), rodzic(X,Y).

% brat
brat(X,Y):-mezczyzna(X),rodzic(A,X),rodzic(A,Y), X\=Y.

% siostra
siostra(X,Y):-kobieta(X),rodzic(A,X),rodzic(A,Y), X\=Y.

%rodzenstwo
rodzenstwo(X,Y):- rodzic(A,X), rodzic(A,Y), X\=Y.

%dziadek
dziadek(X,Z):-
	ojciec(X,Y),
	rodzic(Y,Z).

%dziadek
% dziadek(X,Z):-
% 	mezczyzna(X),
% 	rodzic(X,Y),
% 	rodzic(Y,Z),
% 	wiek(X,Xwiek),
% 	wiek(Y,Ywiek),
% 	wiek(Z,Zwiek),
% 	Xwiek>Ywiek,
% 	Ywiek>Zwiek,
% 	Xwiek>Zwiek,
% 	X\=Y,
% 	Y\=Z,
% 	Z\=X.

%babcia
babcia(X,Z):-
	matka(X,Y),
	rodzic(Y,Z).

%babcia
% babcia(X,Z):-
% 	kobieta(X),
% 	rodzic(X,Y),
% 	rodzic(Y,Z),
% 	wiek(X,Xwiek),
% 	wiek(Y,Ywiek),
% 	wiek(Z,Zwiek),
% 	Xwiek>Ywiek,
% 	Ywiek>Zwiek,
% 	Xwiek>Zwiek,
% 	X\=Y,
% 	Y\=Z,
% 	Z\=X.

% dziadkowie
dziadkowie(X,Y,Z):-
	babcia(X,Z),
	dziadek(Y,Z),
	X \= Y;
	dziadek(X,Z),
	babcia(Y,Z),
	X \= Z.

% wuj
wuj(X,B):-
	brat(X,Y),
	rodzic(Y,B).

% ciotka
ciotka(X,B):-
	siostra(X,Y),
	rodzic(Y,B).

kuzyn(Ja,Osoba):-
	mezczyzna(Osoba),

	wuj(X,Ja),
	rodzic(X,Osoba);

	ciotka(X,Ja),
	rodzic(X,Osoba).


% A → B → C → D
% przodek, rekurencja
przodek(A,B):-
	rodzic(A,B).

przodek(A,D):-
	rodzic(A,Ktos),
	przodek(Ktos,D).


starszy(X,Y):-
	wiek(X,Xwiek),
	wiek(Y,Ywiek),
	Xwiek>Ywiek.

mlodszy(X,Y):-
	wiek(X,Xwiek),
	wiek(Y,Ywiek),
	Xwiek<Ywiek.
