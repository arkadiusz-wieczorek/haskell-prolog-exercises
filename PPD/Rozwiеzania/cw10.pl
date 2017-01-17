/** zad 5 */
max([B], B).
max([H|T], B) :- max(T, W), (H > W -> B = H ; B = W).

/** zad 6 */
znajdz([H|T], 1, H).
znajdz([H|T], E, M) :- (E1 is E-1), znajdz(T, E1, M).

/** zad 7 */
poczatek([], _).
poczatek([H1|T1], [H2|T2]) :- (H1 = H2), poczatek(T1, T2).

/** zad 8 */
ostatni([X], X).
ostatni([H|T], X) :- ostatni(T, X).

/** zad 9 */
nty(E, [E|T], 1).
nty(E, [H|T], X) :- nty(E, T, X1), (X is X1+1).

/** zad 10 */
rosnacy([H1,H2]) :- (H1 < H2).
rosnacy([H1,H2|T]) :- (H1 < H2), rosnacy([H2|T]).


/** zad 1 c */
roznica([], _, []).
roznica([H|T], L, R) :- member(H, L), !, roznica(T, L, R).
roznica([H|T], L, [H|R]) :- roznica(T, L, R).


dlugosc([], 0).
dlugosc([H|T], N) :- dlugosc(T, N1), N is N1+1.