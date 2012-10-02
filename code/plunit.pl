:- begin_tests(set_tests).
:- consult(sets).

test(less1, [true]) :- less(z, s(z)).
test(less2, [true]) :- less(s(s(z)), s(s(s(s(z))))).
test(less3, [fail]) :- less(z,z).
test(less4, [fail]) :- less(s(z), z).

test(checkset1, [true]) :- checkset([z, s(s(z))]).
test(checkset2, [fail]) :- checkset([z, z]).
test(checkset3, [fail]) :- checkset(z).

:- end_tests(set_tests).
