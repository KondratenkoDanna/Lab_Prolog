read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

x_l_w:-see('c:/Users/danna/Desktop/output.txt'),read_list_str(List),seen,
		 tell('c:/Users/danna/Desktop/input.txt'),b_a_r(List,2,[]),told.

		%______________1______________
build_all_razm:-see('c:/Users/danna/Desktop/output.txt'),read_str(List,N,1),seen,
				tell('c:/Users/danna/Desktop/input.txt'),b_a_r(List,2,[]),put(100),told.
		
b_a_r(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,NA),N1 is N-1,b_a_r(NA,N1,[El|Perm]).

build_all_razm_p:-read_str(A,N,0),read(K),b_a_rp(A,K,[]).
		
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).
pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail.


sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,N),read(K),sochet(B,K,A),write_str(B),nl,fail.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p:-read_str(A,N),read(K),sochet_p(B,K,A),write_str(B),nl,fail.

		%______________2______________
		%______________3______________
		%______________4______________
		%______________5______________
		%______________6______________
		%______________7______________
		%______________8______________
		%______________9______________
		%______________10______________
		%______________11______________