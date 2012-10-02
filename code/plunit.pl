:- begin_tests(set_tests).
:- consult(sets).

test(less1, [true]) :- less(z, s(z)).
test(less2, [true]) :- less(s(s(z)), s(s(s(s(z))))).
test(less3, [fail]) :- less(z,z).
test(less4, [fail]) :- less(s(z), z).
test(less5, [fail]) :- less(s(z),s(z)).

test(checkset1, [true]) :- checkset([z, s(s(z))]).
test(checkset2, [fail]) :- checkset([z, z]).
test(checkset3, [fail]) :- checkset(z).

%testing union
%2 empty sets
test(union1,[true]) :- union([],[],[]).
%left empty right something
test(union2,[true]) :- union([],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%left something right empty
test(union3,[true]) :- union([z,s(z),s(s(z))],[],[z,s(z),s(s(z))]).
%2 nonempty disjoint sets
test(union4,[true]) :- union([z,s(z)],[s(s(z)),s(s(s(z)))],[z,s(z),s(s(z)),s(s(s(z)))]).
test(union5,[true]) :- union([s(s(z)),s(s(s(z)))],[z,s(z)],[z,s(z),s(s(z)),s(s(s(z)))]).
%2 nonempty sets that overlap
test(union6,[true]) :- union([z,s(z),s(s(z))],[s(s(z)),s(s(s(z)))],[z,s(z),s(s(z)),s(s(s(z)))]).
test(union7,[true]) :- union([s(s(z)),s(s(s(z)))],[z,s(z),s(s(z))],[z,s(z),s(s(z)),s(s(s(z)))]).
%2 sets that are the same
test(union8,[true]) :- union([z,s(z),s(s(z))],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%test stuff from the assignment
test(union9,[true]) :- union([z], [s(z)], A),A = [z, s(z)].
test(union10,[true]) :- union(X, [s(z)], [z,s(z)]), (X = [z] ; X = [z,s(z)]).

%testing intersection
%2 empty sets
test(intersection1,[true]) :- intersection([],[],[]).
%left empty right something
test(intersection2,[true]) :- intersection([],[z,s(z),s(s(z))],[]).
%left something right empty
test(intersection3,[true]) :- intersection([z,s(z),s(s(z))],[],[]).
%2 nonempty disjoint sets
test(intersection4,[true]) :- intersection([z,s(z)],[s(s(z)),s(s(s(z)))],[]).
test(intersection5,[true]) :- intersection([s(s(z)),s(s(s(z)))],[z,s(z)],[]).
%2 nonempty sets that overlap
test(intersection6,[true]) :- intersection([z,s(z),s(s(z))],[s(s(z)),s(s(s(z)))],[s(s(z))]).
test(intersection7,[true]) :- intersection([s(s(z)),s(s(s(z)))],[z,s(z),s(s(z))],[s(s(z))]).
%2 sets that are the same
test(intersection8,[true]) :- intersection([z,s(z),s(s(z))],[z,s(z),s(s(z))],[z,s(z),s(s(z))]).
%test stuff from the assignment
test(intersection9,[true]) :- intersection([z], [s(z)], A), A = [].
:- end_tests(set_tests).
