read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-read_str(A,_,Flag),append(Cur_list,[A],C_l),
								read_list_str(C_l,List,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

x_l_w:-
		 tell('c:/Users/danna/Desktop/input.txt'),told.

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

		%______________1______________
build_all_razm_p:-read_str(A,_),read(K),tell('c:/Users/danna/Desktop/output.txt'),
				  not(b_a_rp(A,K,[])),told.
		
b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,false.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_perm:-read_str(A,_),tell('c:/Users/danna/Desktop/output.txt'),
				not(b_a_p(A,[])),told.

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

build_all_razm:-read_str(A,_),read(K),tell('c:/Users/danna/Desktop/output.txt'),
				not(b_a_r(A,K,[])),told.
		
b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset(A):-sub_set(B,A),write_str(B),nl,fail.
wr_file_subset:-read_str(A,_),tell('c:/Users/danna/Desktop/output.txt'),
				not(pr_subset(A)),told.

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet(A,K):-sochet(B,K,A),write_str(B),nl,fail.
wr_file_sochet:-read_str(A,_),read(K),tell('c:/Users/danna/Desktop/output.txt'),
				not(pr_sochet(A,K)),told.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p(A,K):-sochet_p(B,K,A),write_str(B),nl,fail.
wr_file_sochet_p:-read_str(A,_),read(K),tell('c:/Users/danna/Desktop/output.txt'),
				not(pr_sochet_p(A,K)),told.

		%______________2______________
make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

aa_razm:-tell('c:/Users/danna/Desktop/output.txt'),not(aa_razm_),told.
aa_razm_:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_pos(Word,Pos_a,[97]),
		 in_list([98,99,100,101,102],S1),
		 in_free_pos(Word,S1),
		 in_list([98,99,100,101,102],S2),
		 in_free_pos(Word,S2),
		 in_list([98,99,100,101,102],S3),
		 in_free_pos(Word,S3),
		 write_str(Word),nl,fail.

put_pos(Word,[Head1,Head2],[Sim]):-select_pos(Word,Head1,Sim),
								 select_pos(Word,Head2,Sim).

select_pos(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_],!);
								 (Head is 2->Word=[_,Sim,_,_,_],!);
								 (Head is 3->Word=[_,_,Sim,_,_],!);
								 (Head is 4->Word=[_,_,_,Sim,_],!);
								 (Head is 5->Word=[_,_,_,_,Sim]).

in_free_pos([H1,H2,H3,H4,H5],Sim):-(var(H1)->H1 is Sim),!;
								  (var(H2)->H2 is Sim),!;
								  (var(H3)->H3 is Sim),!;
								  (var(H4)->H4 is Sim),!;
								  (var(H5)->H5 is Sim).

		%______________3______________
		%______________4______________
		%______________5______________
		%______________6______________
		%______________7______________
		%______________8______________
		%______________9______________
		%______________10______________
		%______________11______________

n:-nodebug.
