write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|Tail]):-write_str(H),write(" "),write_list_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],List,List):-!.
append1([H1|T1],List,[H1|T3]):-append(T1,List,T3).

reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).


		%___________1___________
wr_str:-read_str(A,Length,0),write_str(A),write(","),write_str(A),write(","),
												write_str(A),write(","),write(Length).

		%___________2___________
kol_w:-read_str(A,_,0),append1([32],A,A1),kol_words(A1,0,Kol),write(Kol).
kol_words([_|[]],Kol,Kol):-!.
kol_words([H1|[H2|T]],K,Kol):-(H1=32,H2\=32 -> K1 is K+1,kol_words([H2|T],K1,Kol);
							  kol_words([H2|T],K,Kol)).

		%___________3___________
list_words:-read_str(A,_,0),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).%LW
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append([W],LW,LW1),list_words(T,LW1,LWN,[]);
						 append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);
									kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list:-read_str(A,_,0),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),often_word_in_list(LW,_,Word,0,_),write_str(Word).
often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,
								  often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).
								  
		%___________4___________
concl:-read_str(A,Length,0),(Length>5 -> concl(A),reverse(A,AR),concl(AR);
	   concl(A,Length)).
concl([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
concl([_|_],0):-!.
concl([H|T],Length):-put(H),L1 is Length-1,concl([H|T],L1).

length_list([],0):-!.
length_list([_|T],L):-length_list(T,L1),L is L1+1.

		%___________5___________ 
index_end_all:-read_str(Sr,_,0),reverse(Sr,[H|_],_),EndS = H,list_entry_el(Sr,EndS,_).	

list_entry_el([H|T],El,Num):-list_entry_el([H|T],El,Num,0).
list_entry_el([],_,_,_):-!.
list_entry_el([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num1 = Chet1 -> write(Chet1),write(" "),list_entry_el(T,El,Num1,Chet1);list_entry_el(T,El,Num,Chet1)).

		%___________6___________
index_3:-read_str(St,_,0),index_3(St,0).
index_3([],_):-!.
index_3([H|T],Counter):-Counter1 is Counter+1,(0 is Counter1 mod 3 -> put(H),index_3(T,Counter1);
						index_3(T,Counter1)).

		%___________7___________
kol_plus_minus:-read_str(St,_,0),kol_plus_minus(St,0,KP,0,KM),kol_zero(St,0,KZ),write("Plus = "),write(KP),nl,write("Minus = "),write(KM),nl,write("Zero = "),write(KZ),!.
kol_plus_minus([],KP,KP,KM,KM):-!.
kol_zero([_|[]],KZ,KZ):-!.
kol_zero([H1|[H2|T3]],KZero,KolZero):-((H1=43;H1=45),H2=48 -> KZero1 is KZero+1,kol_zero([H2|T3],KZero1,KolZero);kol_zero([H2|T3],KZero,KolZero)).
kol_plus_minus([43|T],KP,KolP,KM,KolM):-KP1 is KP+1,kol_plus_minus(T,KP1,KolP,KM,KolM).
kol_plus_minus([45|T],KP,KolP,KM,KolM):-KM1 is KM+1,kol_plus_minus(T,KP,KolP,KM1,KolM).
kol_plus_minus([_|T],KP,KolP,KM,KolM):-kol_plus_minus(T,KP,KolP,KM,KolM).


		%___________8___________
		%___________9___________
		%___________10___________
		%___________11___________
		%___________12___________
		%___________13___________
		%___________14___________
		%___________15___________
		%___________16___________
		%___________17___________
		%___________18___________
		%___________19___________
		%___________20___________
		%___________21___________