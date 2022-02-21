count_sym(_,[],0):-!.
count_sym(S,[S|T],R):- count_sym(S,T,R0), R is R0+1.
count_sym(S,[_|T],R):- count_sym(S,T,R).

numcompare2(_,_,[]):-!,false.
numcompare2(A,B,[H|T]):-count_sym(H,A,AC), count_sym(H,B,BC), ((AC < BC,!);(AC > BC,!,false);numcompare2(A,B,T)).
numcompare(A,B):- string(A), string_codes(A,AC),string(B), string_codes(B,BC),string_codes("MDCLXVI",M), numcompare2(AC,BC,M),!.


:- begin_tests(numcompare).

test(one):-   not(numcompare("I", "I")).
test(two):-   numcompare("I", "II").
test(three):- not(numcompare("II", "I")).
test(four):-  not(numcompare("V", "IIII")).
test(five):-  numcompare("MDCLXV", "MDCLXVI").
test(six):-   not(numcompare("MM", "MDCCCCLXXXXVIIII")).

:- end_tests(numcompare).

