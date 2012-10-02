:- begin_tests(set_tests).
:- consult(sets).

test(less, [true]) :- less(z, s(z)).
test(less, [true]) :- less(s(s(z)), s(s(s(s(z))))).
test(less, [fail]) :- less(z,z).
test(less, [fail]) :- less(s(z), z).

test(checkset, [true]) :- checkset([z, s(s(z))]).

:- end_tests(set_tests).
