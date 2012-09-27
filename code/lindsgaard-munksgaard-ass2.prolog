less(z, s(_)).
less(s(X), s(Y)) :- less(X, Y).

/*
Write a predicate checkset/1, such that checkset(t) for a fully
instantiated term t succeeds iff t is a correct representation of some
natural-number set. For example checkset([z, s(s(z))]) should succeed,
while checkset([z,z]) or checkset(z) should fail. The behavior of
checkset on arguments containing unbound logic vari- ables doesn’t
matter.
*/

naturalnum(z).
naturalnum(s(X)) :- naturalnum(X).

checkset([]).
checkset([X]) :- naturalnum(X).
checkset([X, Y | List]) :-
    naturalnum(X),
    less(X,Y),
    checkset(List).


/*
Write a predicate ismember/3, such that if t1 represents a number n, and t2 repre-
sents a set s, then ismember(t1 , t2 , t3 ) succeeds with t3 = yes iff n \∈ s, and with
t3 = no iff n ∈ s. If t1 does not represent a number, and/or t2 does not represent a
set, the behavior if ismember is not constrained.
Additionally, document and explain the behavior of your code on the specific query,
“?- ismember(N, [s(z), s(s(s(z)))], A).”.

*/

ismember(_, [], no).
ismember(X, [X | _], yes).
ismember(X, [Y | _], no) :-
    less(X,Y).
ismember(X, [Y | List], Z) :-
    less(Y,X), 
    ismember(X, List, Z).

/*
Write a predicate union/3, such that if t1 represents s1 , t2
represents s2 , and t3 represents s3 , then union(t1 , t2 , t3 )
succeeds iff s3 = s1 ∪ s2 . If t1 and t2 are instantiated but t3 is a
logic variable, the predicate should compute t3 ; for example, the
query “?- union([z], [s(z)], A).” should succeed with A = [z,
s(z)]. If t1 and/or t2 are logic variables, but t3 is instantiated,
the predicate should enu- merate all possible solutions; for example,
“?- union(X, [s(z)], [z,s(z)]).”  should succeed with X = [z] and X =
[z,s(z)] (not necessarily in that order).  */

union([], X, X).
union(X, [], X).
union([X | XS], [Y | YS], [Y | Z]) :-
    less(Y, X),
    union([X | XS], YS, Z).
union([X | XS], [Y | YS], [X | Z]) :-
    less(X, Y),
    union(XS, [Y | YS], Z).
union([X | XS], [X | YS], [X | Z]) :-
    union(XS, YS, Z).

/*
Write a predicate intersection/3, such that if t1 represents s1 , t2 represents s2 ,
and t3 represents s3 , then intersection(t1 , t2 , t3 ) succeeds iff s3 = s1 ∩ s2 . If t1
and t2 are instantiated but t3 is a logic variable, the predicate should compute t3 ;
for example “?- intersection([z], [s(z)], A).” should succeed with A = [].
(But unlike for union, there are no constraints on what the predicate should do if
t1 and/or t2 are uninstantiated variables.)
*/

intersection([], _, []).
intersection(_, [], []).
intersection([X | XS], [X | YS], [X | Z]) :-
    intersection(XS, YS, Z).
intersection([X | XS], [Y | YS], Z) :-
    less(X, Y),
    intersection(XS, [Y | YS], Z).
intersection([X | XS], [Y | YS], Z) :-
    less(Y, Z),
    intersection([X | XS], Y, Z).
