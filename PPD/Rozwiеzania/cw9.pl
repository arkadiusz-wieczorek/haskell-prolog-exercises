/** zad2a */
ojciec(X,Y) :- (mezczyzna(X), rodzic(X,Y)).
matka(X,Y) :- (kobieta(X), rodzic(X,Y)).
dziadek(X,Y) :- mezczyzna(X), ((ojciec(X,Z), ojciec(Z,Y)) ;(ojciec(X,Z), matka(Z,Y))).
babcia(X,Y) :- kobieta(X), ((matka(X,Z), matka(Z,Y)) ; (matka(X,Z), ojciec(Z,Y))).
rodzenstwo(X,Y) :- ((matka(X,Z), matka(Z,Y)) ; (matka(X,Z), ojciec(Z,Y))).
siostra(X,Y) :- kobieta(X), ((matka(Z,X), matka(Z,Y)) ; (ojciec(Z,X), ojciec(Z,Y))).
brat(X,Y) :- mezczyzna(X), ((matka(Z,X), matka(Z,Y)) ; (ojciec(Z,X), ojciec(Z,Y))).
kuzyn(X,Y) :- mezczyzna(X), (siostra(matka(Z,X),matka(W,Y)) ; siostra(matka(Z,X),ojciec(W,Y)) ; brat(ojciec(Z,X),matka(W,Y)) ; brat(ojciec(Z,X),ojciec(W,Y))).
wuj(X,Y) :- mezczyzna(X), ((rodzic(Z,Y), brat(X,Z))).
przodek(X,Y) :- (rodzic(X,Y)) ; (dziadek(X,Y)) ; (babcia(X,Y)).

/** zad2b */
tylesamolat(X,Y) :- wiek(X, Z), wiek(Y, W), (Z==W).
starszy(X,Y) :- wiek(X, Z), wiek(Y, W), (Z > W).
mlodszy(X,Y) :- wiek(X, Z), wiek(Y, W), (Z < W).


/** zad3a */
studentpoznan(X, Y) :- student(X, Y, C, D, E, F), (E=poznan).

/** zad 3b */
studentpoznaninformatyka(X, Y) :- student(X, Y, C, D, E, F), (C=informatyka), (E=poznan), (F<1994).

/** zad 3c */
studentpolitechnika(X, Y) :- student(X, Y, C, D, E, F), (C=informatyka), ((D=pp) ; (D=pg)).

/** zad 3d */
studentmatematyka(D) :- student(X, Y, C, D, E, F), (C=matematyka).


/** zad 4.1 */
wiekszy(X, Y, Z) :- ((X > Y), (Z = X)) ; ((X < Y), (Y = Z)).

/** zad 4.2 */
suma(X, Y, Z) :- (Z is X+Y).


/** zad5 */
nwd(X, 0, X).
nwd(X, Y, Z):- (not(Y == 0)), (W is X mod Y), (nwd(Y, W, Q)), (Z is Q).


/** zad6 reguly*/
jarosz(ola).
jarosz(ewa).
jarosz(jan).
jarosz(pawel).

uprawiasport(iza).
uprawiasport(ola).
uprawiasport(piotr).
uprawiasport(pawel).

pijekawe(iza).
pijekawe(piotr).
pijekawe(pawel).

czytaksiazki(ola).
czytaksiazki(iza).
czytaksiazki(pawel).

/** zad 6a */
lubi(ola, X) :- jarosz(X), uprawiasport(X), (X \=  ola).

/** zad 6b */
lubi(ewa, X) :- jarosz(X), not(pijekawe(X)), (X \=  ewa).

/** zad 6c */
lubi(iza, X) :- czytaksiazki(X) ; (uprawiasport(X), not(pijekawe(X))), (X \=  iza).

/** zad 6d */
lubi(janek, X) :- uprawiasport(X), (X \=  janek).

/** zad 6e */
lubi(piotr, X) :- (uprawiasport(X), jarosz(X)) ; (czytaksiazki(X)), (X \=  piotr).

/** zad 6f */
lubi(pawel, X) :- jarosz(X), uprawiasport(X), czytaksiazki(X), (X \=  pawel).

/** zad 6 calosc */
przyjaciele(X, Y) :- lubi(X, Y), lubi(Y, X), X \= Y.

memberk(E, [E|_]).
memberk(E, [_|T]) :- memberk(E, T).