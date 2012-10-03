:- module(sets, [less/2, checkset/1, ismember/3, union/3, intersection/3]).

naturalnum(z).
naturalnum(s(X)) :- naturalnum(X).

% Exercise 1:

less(z, s(Y)) :- naturalnum(Y).
less(s(X), s(Y)) :- less(X, Y).

% Exercise 2:

checkset([]).
checkset([X]) :- naturalnum(X).
checkset([X, Y | List]) :-
    less(X, Y),
    checkset([Y | List]).

% Exercise 3

ismember(X, [], no) :- naturalnum(X).
ismember(X, [X | _], yes) :- naturalnum(X).
ismember(X, [Y | List], no) :-
    less(X,Y),
    checkset(List).
ismember(X, [Y | List], Z) :-
    less(Y,X),
    ismember(X, List, Z).

% Exercise 4

union(XS, [], XS) :- checkset(XS).
union([], YS, YS) :- checkset(YS).
union([X | XS], [Y | YS], [Y | Z]) :-
    less(Y, X),
    union([X | XS], YS, Z).
union([X | XS], [Y | YS], [X | Z]) :-
    less(X, Y),
    union([Y | YS], XS, Z).
union([X | XS], [X | YS], [X | Z]) :-
    naturalnum(X),
    union(XS, YS, Z).

% Exercise 5
intersection(XS, [], []) :- checkset(XS).
intersection([], YS, []) :- checkset(YS).
intersection([X | XS], [X | YS], [X | Z]) :-
    naturalnum(X),
    intersection(XS, YS, Z).
intersection([X | XS], [Y | YS], Z) :-
    less(X, Y),
    intersection([Y | YS], XS, Z).
intersection([X | XS], [Y | YS], Z) :-
    less(Y, X),
    intersection([X | XS], YS, Z).

% vim: syntax=prolog
