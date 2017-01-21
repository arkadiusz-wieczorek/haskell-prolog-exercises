wiekszy(X,Y,Z):-
	X>Y,
	Z = X;
	X<Y,
	Z = Y.

suma(X,Y,Z):-
	Z is X+Y.
