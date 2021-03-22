write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

read_list_str(List):-read_str(A,N,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

		%______________1______________
list_words:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append1([W],LW,LW1),list_words(T,LW1,LWN,[]);
						 append1([H],W,W1),list_words(T,LW,LWN,W1)).

length_word([],0):-!.
length_word([_|T],L):-length_word(T,L1),L is L1+1.

max_l_w:-see('c:/Users/danna/Desktop/output.txt'),read_list_str(File),seen,
		 tell('c:/Users/danna/Desktop/input.txt'),max_l_w(File,0,K),write(K),told.

max_l_w([],K,K):-!.
max_l_w([H|T],K,Kol):-length_word(H,L),(L>K -> K1 is L,max_l_w(T,K1,Kol);max_l_w(T,K,Kol)).


		%______________2______________
		%______________3______________
		%______________4______________
		%______________5______________
		%______________6.2______________
		%______________6.10______________
		%______________6.17______________