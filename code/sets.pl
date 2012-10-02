% Exercise 1:

less(z, s(_)).
less(s(X), s(Y)) :- less(X, Y).


% Exercise 2:

naturalnum(z).
naturalnum(s(X)) :- naturalnum(X).

checkset([]).
checkset([X]) :- naturalnum(X).
checkset([X, Y | List]) :-
    naturalnum(X),
    less(X,Y),
    checkset(List).


% Exercise 3
ismember(_, [], no).
ismember(X, [X | _], yes).
ismember(X, [Y | _], no) :-
    less(X,Y).
ismember(X, [Y | List], Z) :-
    less(Y,X),
    ismember(X, List, Z).

% Exercise 4

union(X, [], X).
union([], Y, Y).
union([X | XS], [Y | YS], [Y | Z]) :-
    less(Y, X),
    union([X | XS], YS, Z).
union([X | XS], [Y | YS], [X | Z]) :-
    less(X, Y),
    union([Y | YS], XS, Z).
union([X | XS], [X | YS], [X | Z]) :-
    union(XS, YS, Z).


% Exercise 5

intersection(_, [], []).
intersection([], _, []).
intersection([X | XS], [X | YS], [X | Z]) :-
    intersection(XS, YS, Z).
intersection([X | XS], [Y | YS], Z) :-
    less(X, Y),
    intersection([Y | YS], XS, Z).
intersection([X | XS], [Y | YS], Z) :-
    less(Y, X),
    intersection([X | XS], YS, Z).
