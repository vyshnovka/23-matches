play :-
writeln("Try yourself with 23 matches!"), nl,
writeln("Wanna start first? (1 - yes, 0 - no)"),
read(First),
game(23, First), !.

game(1, 0) :- nl, writeln("Congratulations! :)"), !.
game(1, 1) :- nl, writeln("Game over! You took the last match! :("), !.

game(M, 0) :-
step(M, T), nl,
write("Computer took "), write(T), (T == 1 -> write(" match..."); write(" matches...")), nl,
M1 is M - T, write(M1), (M1 == 1 -> write(" match"); write(" matches")), write(" left"), nl,
game(M1, 1), !.

game(M, 1) :-
nl, writeln("Take 1, 2 or 3 matches..."), read(T),
write("You took "), write(T), (T == 1 -> write(" match..."); write(" matches...")), nl,
M1 is M - T, write(M1), (M1 == 1 -> write(" match"); write(" matches")), write(" left"), nl,
game(M1, 0), !.

step(M, T) :- Mod is M mod 4, Mod = 0, T is 3, !.
step(M, T) :- Mod is M mod 4, Mod = 3, T is 2, !.
step(M, T) :- Mod is M mod 4, Mod = 2, T is 1, !.
step(M, T) :- Mod is M mod 4, Mod = 1, T is 1, !.
