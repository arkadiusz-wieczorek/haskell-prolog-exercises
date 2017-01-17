/** zad1 a */
iloczyn([], _, []).
iloczyn([H|T], L, W) :- member(H, L), (W = [H|R]), !, iloczyn(T, L, R). 
iloczyn([_|T], L, R) :- iloczyn(T, L, R).

/** zad1 b */
suma([], L, L) :- !.
suma([H|T], L, S) :- member(H, L), !, suma(T, L, S).
suma([H|T], L, [H|S]) :- suma(T, L, S).

/** zad 1 c */
roznica([], _, []).
roznica([H|T], L, R) :- member(H, L), !, roznica(T, L, R).
roznica([H|T], L, [H|R]) :- roznica(T, L, R).

/** zad 2 */
menu_glowne :-
				write('Lista polecen: '),
				nl,
				write('pisz_student - dodaje nowego studenta'),
				nl,
				write('usun_student - usuwa studenta o podanych argumentach'),
				nl,
				write('pokaz_student - wyswietla wszystkich studentow'),
				nl.

/** zad2 a */
pisz_student :-
				write('Podaj imie: '),
				read(Name),
				write('Podaj nazwisko: '),
				read(Surname),
				write('Podaj numer indeksu: '),
				read(Index),
				append('plik.pl'),
				write(student(Name,Surname,Index)),
				write(.),
				nl,
				told.

/** zad2 b */
usun_student :- 
				write('Podaj imie: '),
				read(Name),
				write('Podaj nazwisko: '),
				read(Surname),
				write('Podaj numer indeksu: '),
				read(Index),
				consult('plik.pl'),
				retractall(student(Name, Surname, Index)),
				tell('plik.pl'),
				listing(student),
				told.


/** zad2 c */
czytaj_student(L) :- L='end_of_file', !.
czytaj_student(L) :-
					write(L),
					read(X),
					nl,
					czytaj_student(X).

pokaz_student :- 
				write('Lista wszystkich studentow: '),
				nl,
				see('plik.pl'),
				read(_),
				read(X),
				czytaj_student(X),
				seen.