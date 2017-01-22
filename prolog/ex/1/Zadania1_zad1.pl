% Zadanie 1.
% Otworzyć w SWI-Prolog plik o nazwie baza_danych.pl zawierający pewne informacje
% o samochodach w pewnym salonie samochodowym i informacje o studentach na pewnej
% uczelni. Zadać w Prologu następujące pytania:

% 1. Czy w salonie można kupić opla?
auto(opel, X, Y, Z).

% 2. Czy w salonie można kupić czarne bmw?
auto(bmw, czarny, Y, Z).

% 3. Czy w salonie można kupić jakiekolwiek auto w kolorze białym?
auto(Auto, bialy, Y, Z).

% 4. Jakie można kupić auta o przebiegu mniejszym niż 20000km?
auto(X, Y, Z, Przebieg), Przebieg<20000.

% 5. Jakie auta z rocznika 2000 oferowane są w sprzedaży?
auto(X, Y, 2000, P).

% 6. Jaki kolor ma jaguar i z jakiego jest rocznika?
auto(jaguar, Kolor, Rocznik, Z).

% 7. Czy Kowalski studiuje matematykę?
student(kowalski, X, matematyka, Y).

% 8. Kto studiuje matematykę?
student(X, Y, matematyka, Z).

% 9. Jacy studenci urodzili się po 1993 roku?
student(X, Y, Z, Rok), Rok>1993.

% 10. Kto studiuje fizykę lub chemię?
student(X, Y, Przedmiot, Z), Przedmiot = fizyka; Przedmiot = chemia.

% 11. Czy ktokolwiek studiuje informatykę?
student(X, Y, informatyka, Z).

% 12. Na jakim kierunku studiuje Kowalska Ada?
student(kowalska, ada, Kierunek, Z).


% Zadanie 2.
% Otworzyć w SWI-Prolog plik o nazwie rodzina.pl zawierający dane o członkach pewnej
% rodziny. Zadać w Prologu następujące pytania:

% 1. Kto jest rodzicem Marty?
rodzic(X, marta).

% 2. Czy w rodzinie jest kobieta o imieniu Katarzyna?
kobieta(katarzyna).

% 3. Jakich potomków ma Ewa?
rodzic(ewa,X).

% 4. Czy Marek jest rodzicem Oli?
rodzic(marek,ola).

% 5. Czy Iwona jest rodzicem Izy?
rodzic(iwona, iza).

% 6. Ile lat ma Anna?
wiek(anna,X).
