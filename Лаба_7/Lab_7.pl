write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|Tail]):-write_str(H),write(" "),write_list_str(Tail).

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

min_list_lists([[H|T]|T1],Min):-min_list_lists([[H|T]|T1],255,Buf,Min).
min_list_lists([],_,M,M):-!.
min_list_lists([[H|T]|T1],M,Buf,Min):-(H<M -> M1 is H,min_list_lists(T1,M1,[H|T],Min);
		            min_list_lists(T1,M,Buf,Min)).

reverse_list(List,ListR):-reverse_list(List,[],ListR).
reverse_list([],Buffer,Buffer):-!.
reverse_list([H|T],Buffer,ListR):-reverse_list(T,[H|Buffer],ListR).

		%___________1___________
wr_str:-read_str(A,Length),write_str(A),write(","),write_str(A),write(","),
												write_str(A),write(","),write(Length).

		%___________2___________
kol_w:-read_str(A,_),append1([32],A,A1),kol_words(A1,0,Kol),write(Kol).
kol_words([_|[]],Kol,Kol):-!.
kol_words([H1|[H2|T]],K,Kol):-(H1=32,H2\=32 -> K1 is K+1,kol_words([H2|T],K1,Kol);
							  kol_words([H2|T],K,Kol)).

		%___________3___________
list_words:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).%LW
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append([W],LW,LW1),list_words(T,LW1,LWN,[]);
						 append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);
									kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),often_word_in_list(LW,_,Word,0,_),write_str(Word).
often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,
								  often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).
								  
		%___________4___________
concl:-read_str(A,Length),(Length>5 -> concl(A),reverse(A,AR),conclL(AR);concl(A,Length)).
concl([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
concl([_|_],0):-!.
concl([H|T],Length):-put(H),L1 is Length-1,concl([H|T],L1).
conclL([H1|[H2|[H3|_]]]):-put(H3),put(H2),put(H1),!.

length_list([],0):-!.
length_list([_|T],L):-length_list(T,L1),L is L1+1.

		%___________5___________ 
index_end_all:-read_str(Sr,_),reverse(Sr,[H|_],_),EndS = H,list_entry_el(Sr,EndS,_).	

list_entry_el([H|T],El,Num):-list_entry_el([H|T],El,Num,0).
list_entry_el([],_,_,_):-!.
list_entry_el([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num1 = Chet1 -> write(Chet1),write(" "),list_entry_el(T,El,Num1,Chet1);list_entry_el(T,El,Num,Chet1)).

		%___________6___________
index_3:-read_str(St,_),index_3(St,0).
index_3([],_):-!.
index_3([H|T],Counter):-Counter1 is Counter+1,(0 is Counter1 mod 3 -> put(H),index_3(T,Counter1);
						index_3(T,Counter1)).

		%___________7___________
kol_zero([_|[]],KZ,KZ):-!.
kol_zero([H1|[H2|T3]],KZero,KolZero):-((H1=43;H1=45),H2=48 -> KZero1 is KZero+1,kol_zero([H2|T3],KZero1,KolZero);kol_zero([H2|T3],KZero,KolZero)).
kol_plus_minus:-read_str(St,_),kol_plus_minus(St,0,KP,0,KM),kol_zero(St,0,KZ),write("Plus = "),write(KP),nl,write("Minus = "),write(KM),nl,write("Zero = "),write(KZ),!.
kol_plus_minus([],KP,KP,KM,KM):-!.
kol_plus_minus([43|T],KP,KolP,KM,KolM):-KP1 is KP+1,kol_plus_minus(T,KP1,KolP,KM,KolM).
kol_plus_minus([45|T],KP,KolP,KM,KolM):-KM1 is KM+1,kol_plus_minus(T,KP,KolP,KM1,KolM).
kol_plus_minus([_|T],KP,KolP,KM,KolM):-kol_plus_minus(T,KP,KolP,KM,KolM).

		%___________8___________
list_el_num([H|T],El,Num):-list_el_num([H|T],El,Num,0).
list_el_num([],119,0,_):-write("w no exist"),nl,!.
list_el_num([],120,0,_):-write("x no exist"),nl,!.
list_el_num([],_,0,_):-!.
list_el_num([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num = Chet1 -> !;list_el_num(T,El,Num,Chet1)).

w_v:-read_str(St,_),write(St),nl,w_v(St).
w_v(St):-list_el_num(St,119,N1),list_el_num(St,120,N2),N1\=N2,
				  (N1<N2 -> write("Exist: "),put(119),nl;write("Exist: "),put(120)).

		%___________9___________
length_list([],K,K):-!.
length_list([_|T],K,Kol):-K1 is K+1,length_list(T,K1,Kol).

big_st:-read_str(St1,N1),read_str(St2,N2),(N1>N2 -> N3 is N1-N2,write_n(N3,St1);N3 is N2-N1,
		write_n(N3,St2)).
write_n(0,_):-!.
write_n(N,St):-write_str(St),N1 is N-1,write_n(N1,St).

		%___________10___________
begin_word:-read_str(St,_),begin_word(St,St1),write_str(St1).

begin_word([H1,H2,H3|T],List1):-H1=97,H2=98,H3=99,List1 = [119,119,119|T],!.
begin_word(List,List1):-append1(List,[122,122,122],List1),!.

		%___________11___________
l_str:-read_str(St,Length),(Length>10 -> l_str(St,StN);l_str(St,Length,12,StN)),write_str(StN).
l_str(St,StN):- StN = [_,_,_,_,_,_],append1(StN,_,St),!.
l_str(StN,12,_,StN):-!.
l_str(St,L,Length,StN):-L1 is L+1,append1(St,[111],St1),l_str(St1,L1,Length,StN).

		%___________12___________///////////////////////////////////////
fragments:-read_str(St,_),fragments(St,[],LFr),sort(LFr).
fragments([],LFr,LFr):-!.
fragments([H1,H2,H3|T],LFr,LF):-rand_fr([H1,H2,H3],R),append1(LFr,[R],LFr1),fragments(T,LFr1,LF),!.
rand_fr([H1,H2,H3],R):-H is random(256),(not(in_list([H1,H2,H3],H)) -> R = [H1,H,H3];
					   rand_fr([H1,H2,H3],R)).					   

sort([]):-!.
sort([H|T]):-min_list_lists([H|T],Min),write_str(Min),remove_number([H|T],Min,LN),sort(LN).

remove_number([[H1|T]|T1],X,List):-remove_number([H1|T1],[],List,X).
remove_number([],Buffer,List2,_):-reverse_list(Buffer,List2),!.
remove_number([H1|T1],Buffer,List2,X):-(H1=X -> remove_number(T1,Buffer,X);
								 remove_number(T1,[H1|Buffer],List2,X)).

		%___________13___________
replace_4:-read_str(St,_),replace_4(St,0,[],NSt),reverse(NSt,NStR),write_str(NStR).
replace_4([],_,St,St):-!.
replace_4([H|T],Counter,NSt,NStr):-Counter1 is Counter+1,0 is Counter1 mod 2,(H\=97,H\=98 
								    -> append1([97],NSt,NSt1),replace_4(T,Counter1,NSt1,NStr),!;
								    append1([99],NSt,NSt1),replace_4(T,Counter1,NSt1,NStr)),!.
replace_4([H|T],Counter,NSt,NStr):-Counter1 is Counter+1,append1([H],NSt,NSt1),
								   replace_4(T,Counter1,NSt1,NStr).

		%___________14___________48-57
kol_numbers:-read_str(St,_),kol_numbers(St,0,Kol),write(Kol).
kol_numbers([],K,K):-!.
kol_numbers([H|T],K,Kol):-H>47,H<58,K1 is K+1,kol_numbers(T,K1,Kol),!.
kol_numbers([_|T],K,Kol):-kol_numbers(T,K,Kol),!.

		%___________15___________
st_abc:-read_str(St,_),st_abc(St).
st_abc([]):-!.
st_abc([H|_]):-H\=97,H\=98,H\=99,!,fail.
st_abc([_|T]):-st_abc(T).

		%___________16___________
replace_word:-read_str(St,_),replace_word(St,[],NL),write_str(NL).
replace_word([],NL,NL):-!.
replace_word([119,111,114,100|T],Buffer,NL):-append(Buffer,[108,101,116,116,101,114],BufferN),
								  replace_word(T,BufferN,NL),!.
replace_word([H|T],Buffer,NL):-append1(Buffer,[H],BufferN),replace_word(T,BufferN,NL),!.								  	

		%___________17___________
remove_x_abc:-read_str(St,_),remove_x_abc(St,[],NL),write_str(NL).
remove_x_abc([],NL,NL):-!.
remove_x_abc([120,97,98,99|T],Buffer,NL):-append1(Buffer,[97,98,99],BufferN),remove_x_abc(T,BufferN,NL),!.
remove_x_abc([H|T],Buffer,NL):-append1(Buffer,[H],BufferN),remove_x_abc(T,BufferN,NL).

		%___________18___________
remove_abc_numb:-read_str(St,_),remove_abc_numb(St,[],NL),write_str(NL).
remove_abc_numb([],NL,NL):-!.
remove_abc_numb([97,98,99,H|T],Buffer,NL):-H>47,H<58,remove_abc_numb([H|T],Buffer,NL),!.
remove_abc_numb([H|T],Buffer,NL):-append1(Buffer,[H],BufferN),remove_abc_numb(T,BufferN,NL).

		%___________19___________
kol_aba:-read_str(St,_),kol_aba(St,0,Kol),write(Kol).
kol_aba([],K,K):-!.
kol_aba([97,98,97|T],K,Kol):-K1 is K+1,kol_aba(T,K1,Kol),!.
kol_aba([_|T],K,Kol):-kol_aba(T,K,Kol).

		%___________20___________
widespace:-read_str(St,_),widespace(St,0,[],NSt),widespace(NSt,StStart),reverse(StStart,StEnd),
		   widespace(StEnd,Stroka),reverse(Stroka,StrokaR),write_str(StrokaR).
widespace([],_,NL,NL):-!.
widespace([32|T],0,Buffer,NL):-append1(Buffer,[32],BufferN),widespace(T,1,BufferN,NL),!.
widespace([32|T],KolWS,Buffer,NL):-widespace(T,KolWS,Buffer,NL),!.
widespace([H|T],_,Buffer,NL):-append1(Buffer,[H],BufferN),widespace(T,0,BufferN,NL),!.
widespace([32|T],NSt):-widespace(T,NSt),!.
widespace(Nst,Nst):-!.

		%___________21.1___________
splitting:-read_str([H|T],_),read_str(St2,_),(in_list(St2,H) -> splitting(T,St2,[],[],LW);splitting([H|T],St2,[],[],LW)),
		   write_list_str(LW).
splitting([],_,[],LW,LW):-!.
splitting([],_,LastWord,LW,ListWord):-append1(LW,[LastWord],ListWord),!.
splitting([H|T],List2,BufferWord,LW,ListWord):-not(in_list(List2,H)),append1(BufferWord,[H],BufferWordN),	
												   splitting(T,List2,BufferWordN,LW,ListWord),!.
splitting([H1|T],List2,BufferWord,LW,ListWord):-append1(LW,[BufferWord],NLW),splitting(T,List2,[],NLW,ListWord).	

		%___________21.2___________
print_sr:-read_str(St,Length),print_sr(St),print_sr(St,Length).
print_sr([H|T]):-write("First = "),put(H),nl,reverse([H|T],[HR|TR]),write("End = "),put(HR),nl.
print_sr(List,Length):-not(0 is Length mod 2),L is Length div 2+1,index(List,El,L,0),write("Middle = "),put(El),!.
print_sr(List,Length):-true.

index([H|T],El,Num):-index([H|T],El,Num,0).
index([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,Num = Chet1 -> !;index(T,El,Num,Chet1)).

