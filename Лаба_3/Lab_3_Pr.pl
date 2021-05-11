max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact_d(N,X,N,X).
fact_d(I,F,N,X):-I1 is I+1,F1 is F*I1,fact_d(I1,F1,N,X).

fact_d(N,X):-fact_d(0,1,N,X).

fib_up(1,1) :- ! .
fib_up(2,1) :- ! .
fib_up(N,X):-N1 is N-1,fib_up(N1,X1),N2 is N-2,fib_up(N2,X2),X is X1+X2.

fib_down(N,F):-N1 is N-1,fib_down(N1,1,1,F).
fib_down(1,C,_,C):-!.
fib_down(N,X,Y,F):-N1 is N-1,X1 is X+Y,Y1 is X,fib_down(N1,X1,Y1,F).

sum_num_up(0,0):-!.
sum_num_up(N,S):-N1 is N div 10,sum_num_up(N1,S1),S is S1 + N mod 10.

sum_num_down(N,S):-sum_num_down(N,0,S).
sum_num_down(0,S,S):-!.
sum_num_down(N,S,Sum):-N2 is N mod 10,N1 is N div 10,
		       S1 is S+N2,sum_num_down(N1,S1,Sum).

max_digit_up(0,0):-!.
max_digit_up(N,MaxD):-ND is N div 10,max_digit_up(ND,MaxND),
          NM is N mod 10,(NM>MaxND -> MaxD is NM;MaxD is MaxND).

max_digit_down(N,Max):-max_digit_down(N,0,Max).
max_digit_down(0,Max,Max):-!.
max_digit_down(N,M,Max):-ND is N div 10,NM is N mod 10,
           (NM>M -> M1 = NM; M1 = M),max_digit_down(ND,M1,Max).

sum_digit_3_down(N,Sum):-sum_digit_3_down(N,0,Sum).
sum_digit_3_down(0,_,1):-!.
sum_digit_3_down(1,Sum,Sum):-!.
sum_digit_3_down(2,Sum,Sum):-!.
sum_digit_3_down(3,S,Sum):-Sum is S+1,!.
sum_digit_3_down(4,Sum,Sum):-!.
sum_digit_3_down(5,Sum,Sum):-!.
sum_digit_3_down(6,S,Sum):-Sum is S+1,!.
sum_digit_3_down(7,Sum,Sum):-!.
sum_digit_3_down(8,Sum,Sum):-!.
sum_digit_3_down(9,S,Sum):-Sum is S+1,!.
sum_digit_3_down(N,S,Sum):-ND is  N div 10,NM is N mod 10,
    (0 is NM mod 3 ->  S1 is S+1;S1 = S),
    sum_digit_3_down(ND,S1,Sum).

nod(X,X,X):-!.
nod(X,Y,Z):-(X>Y -> X1 is X-Y,nod(X1,Y,Z);
                    Y1 is Y-X,nod(X,Y1,Z)).

psimple(N):-N1 is N-1,psimple(N,N1).
psimple(_,1):-!.
psimple(N,N1):-M is N mod N1,M \= 0,N2 is N1-1,psimple(N,N2).

kol_del(1,_,1):-!.
kol_del(I,N,Count):-I1 is I-1,kol_del(I1,N,Count1),
	(0 is N mod 10 -> Count is Count1+1;Cont is Count1).
