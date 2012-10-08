:- begin_tests(set_tests).
:- use_module(sets).

test(less1, [true]) :- less(z, s(z)).
test(less2, [true]) :- less(s(s(z)), s(s(s(s(z))))).
test(less3, [fail]) :- less(z,z).
test(less4, [fail]) :- less(s(z), z).
test(less5, [fail]) :- less(s(z),s(z)).

test(checkset1, [true, nondet]) :- checkset([z, s(s(z))]).
test(checkset2, [fail]) :- checkset([z, z]).
test(checkset3, [fail]) :- checkset(z).
test(checkset4, [fail]) :- checkset([s(z), z]).
test(checkset5, [true]) :- checkset([]).
test(checkset6, [true, nondet]) :- checkset([z]).
test(checkset7, [fail]) :- checkset([1]).
test(checkset8, [fail]) :- checkset([a]).
test(checkset9, [true, nondet]) :- checkset([z, s(z), s(s(s(z)))]).
test(checkset10, [fail]) :- checkset([s(z), s(s(z)), z]).

test(ismember1, [true, nondet]) :-
    ismember(z, [z], A),
    A = yes.
test(ismember2, [true, nondet]) :-
    ismember(z, [z, s(z)], A),
    A = yes.
test(ismember3, [true, nondet]) :-
    ismember(z, [], A),
    A = no.
test(ismember4, [fail]) :-
    ismember(z, z, _).
test(ismember5, [true, nondet]) :-
    ismember(s(s(z)), [z, s(s(z))], A),
    A = yes.
test(ismember6, [true, nondet]) :-
    ismember(s(z), [z, s(s(z)), s(s(s(z))), s(z)], A),
    A = no.
test(ismember7, [true, nondet]) :-
    ismember(s(s(s(z))), [z, s(s(z))], A),
    A = no.
test(ismember8, [true, nondet]) :-
    ismember(s(z), [z, s(s(z)) | _], no).
test(ismember9, all(X == [z, s(z)])) :-
    ismember(X, [z, s(z)], yes).

%testing union
%2 empty sets
test(union1,[true, nondet]) :- union([],[],[]).
%left empty right something
test(union2,[true, nondet]) :-
    union([],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%left something right empty
test(union3,[true, nondet]) :-
    union([z,s(z),s(s(z))],[],[z,s(z),s(s(z))]).
%2 nonempty disjoint sets
test(union4,[true, nondet]) :-
    union([z,s(z)],[s(s(z)),s(s(s(z)))],[z,s(z),s(s(z)),s(s(s(z)))]).
test(union5,[true, nondet]) :-
    union([s(s(z)),s(s(s(z)))],[z,s(z)],[z,s(z),s(s(z)),s(s(s(z)))]).
%2 nonempty sets that overlap
test(union6,[true, nondet]) :-
    union([z,s(z),s(s(z))],[s(s(z)),s(s(s(z)))],[z,s(z),s(s(z)),s(s(s(z)))]).
test(union7,[true, nondet]) :-
    union([s(s(z)),s(s(s(z)))],[z,s(z),s(s(z))],[z,s(z),s(s(z)),s(s(s(z)))]).
%2 sets that are the same
test(union8,[true, nondet]) :-
    union([z,s(z),s(s(z))],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%test stuff from the assignment
test(union9,[true, nondet]) :-
    union([z], [s(z)], A),
    A = [z, s(z)].
test(union10,[true], all(X == [[z], [z, s(z)]])) :-
    union(X, [s(z)], [z,s(z)]).

%testing intersection
%2 empty sets
test(intersection1,[true, nondet]) :- intersection([],[],[]).
%left empty right something
test(intersection2,[true, nondet]) :-
    intersection([],[z,s(z),s(s(z))],[]).
%left something right empty
test(intersection3,[true, nondet]) :-
    intersection([z,s(z),s(s(z))],[],[]).
%2 nonempty disjoint sets
test(intersection4,[true, nondet]) :-
    intersection([z,s(z)],[s(s(z)),s(s(s(z)))],[]).
test(intersection5,[true, nondet]) :-
    intersection([s(s(z)),s(s(s(z)))],[z,s(z)],[]).
%2 nonempty sets that overlap
test(intersection6,[true, nondet]) :-
    intersection([z,s(z),s(s(z))],[s(s(z)),s(s(s(z)))],[s(s(z))]).
test(intersection7,[true, nondet]) :-
    intersection([s(s(z)),s(s(s(z)))],[z,s(z),s(s(z))],[s(s(z))]).
%2 sets that are the same
test(intersection8,[true, nondet]) :-
    intersection([z,s(z),s(s(z))],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%test stuff from the assignment
test(intersection9,[true, nondet]) :-
    intersection([z], [s(z)], A), A = [].
:- end_tests(set_tests).

% vim: syntax=prolog
