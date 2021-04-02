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

length_word([],0):-!.
length_word([_|T],L):-length_word(T,L1),L is L1+1.

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_([El|_],El):-!.
in_list_([_|T],El):-in_list_(T,El).

reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-read_str(A,_,Flag),append(Cur_list,[A],C_l),
								read_list_str(C_l,List,Flag).

		%______________1______________
max_l_w:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(List),seen,
		 tell('c:/Users/danna/Desktop/output.txt'),max_l_w(List,0,K),write(K),told.
max_l_w([],K,K):-!.
max_l_w([H|T],K,Kol):-length_word(H,L),(L>K -> K1 is L,max_l_w(T,K1,Kol);max_l_w(T,K,Kol)).

		%______________2______________
kol_st_no_zero:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(List),seen,
				tell('c:/Users/danna/Desktop/output.txt'),kol_st_no_zero(List,0,Kol),write(Kol),told.

kol_st_no_zero([],K,K):-!.
kol_st_no_zero([H|T],K,Kol):-not(in_list(H,32)),K1 is K+1,kol_st_no_zero(T,K1,Kol),!.
kol_st_no_zero([_|T],K,Kol):-kol_st_no_zero(T,K,Kol),!.

		%______________3______________
sr_A:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(List),seen,
	  tell('c:/Users/danna/Desktop/output.txt'),kol_A_in_list(List,0,KA),
	  sr_kol_A(List,KA,SrA),write_stroka_srA(List,SrA),told.
sr_kol_A([H|T],KolA,SrA):-length_word([H|T],L),SrA is KolA div L.
kol_A_in_list([],K,K):-!.
kol_A_in_list([H|T],K,Kol):-kol_A(H,0,KolA),K1 is K+KolA,kol_A_in_list(T,K1,Kol).
write_stroka_srA([],_):-!.
write_stroka_srA([H|T],SrKolA):-kol_A(H,0,K),K>SrKolA,write_str(H),nl,write_stroka_srA(T,SrKolA),!.
write_stroka_srA([_|T],SrKolA):-write_stroka_srA(T,SrKolA),!.

		%______________4______________
list_words(A,LW):-append1(A,[32],Apr),list_words(Apr,[],LW,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-((H=32;H=10) -> append1(LW,[W],LW1),list_words(T,LW1,LWN,[]);
						 append1(W,[H],W1),list_words(T,LW,LWN,W1)).
list_words_all_file([],ListAllWord,ListAllWord):-!.
list_words_all_file(Stroka,List,ListAllWord):-list_words(Stroka,LW),append1(List,LW,ListAllWord).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);
									kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list:-see('c:/Users/danna/Desktop/input.txt'),read_str(A,_,1),seen,
					tell('c:/Users/danna/Desktop/output.txt'),list_words_all_file(A,[],ListAllWord),
					often_word_in_list(ListAllWord,_,Word,0,_),write_str(Word),told.
often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,
					    often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).

		%______________5______________
no_repeat_str:-see('c:/Users/danna/Desktop/input.txt'),read_str(A,_,1),seen,
	           tell('c:/Users/danna/Desktop/output.txt'),list_words_all_file(A,[],ListWordAllFile),
			   proverka_(ListWordAllFile,ListWordAllFile),told.
			  
proverka_(_,[]):-!.
proverka_(ListWordAllFile,[H|T]):- list_words(H,ListWordInStr),
					proverka(ListWordAllFile,ListWordInStr),write_str(H),nl,proverka_(ListWordAllFile,T),!.
proverka_(ListWordAllFile,[_|T]):-proverka_(ListWordAllFile,T).
proverka(_,[]):-true,!.
proverka(AllListWord,[H|T]):-kol_repeat_in_list(AllListWord,H,KolPovt),KolPovt<2,proverka(AllListWord,T),!.
proverka(_,[_|_]):-!,fail.

		%______________2.2_____________
sort_list:-see('c:/Users/danna/Desktop/input.txt'),read_str(A,_,1),seen,
		   tell('c:/Users/danna/Desktop/output.txt'),sort_list(A),told.
sort_list([_]):-write("Yes"),!.
sort_list([H1,H2|T]):-H1<H2,!,sort_list([H2|T]).
sort_list([_,_|_]):-write("No"),!.

		%______________2.10______________
kol_A:-see('c:/Users/danna/Desktop/input.txt'),read_str(St,_,1),seen,
	   tell('c:/Users/danna/Desktop/output.txt'),kol_A(St,0,K),write(K),told.	
kol_A([],K,K):-!.
kol_A([H|T],K,Kol):-H=65,K1 is K+1,kol_A(T,K1,Kol),!.
kol_A([_|T],K,Kol):-kol_A(T,K,Kol).

		%______________2.17______________
file_name:-see('c:/Users/danna/Desktop/input.txt'),read_str(St,_,1),seen,
		   tell('c:/Users/danna/Desktop/output.txt'),file_name(St,[],NameFile),write_str(NameFile),told.
file_name([46|_],NameF,NameF):-!.
file_name([H|T],Buf,NameF):-H=47,Name1 = Buf,file_name(T,[],NameF),!.
file_name([H|T],Buf,NameF):-append1(Buf,[H],BufN),file_name(T,BufN,NameF).

		%______________3.0______________
d:-see('c:/Users/danna/Desktop/input.txt'),read_str(A,_,1),seen,date(A,Res),write_list_str(Res).
date(List,Res):-date(List,[],Res).
date([],Res,Res):-!.
date([H|T],Buffer,Res):-date_check([H|T],DMY),append1(Buffer,[DMY],Buf1),!,date(T,Buf1,Res).
date([H|T],Buf,Res):-date(T,Buf,Res).
date_check(List,DMY):-date_day(List,Day,Date),date_month(Date,Month,Date1),date_year(Date1,Year,Date2),
				append1(Day,Month,DM),append1(DM,Year,DMY),!.
date_day([H1,H2,32|T],Buf,Date):-H1<52,H1>47,H2>47,H2<58,Buf=[H1,H2,32],Date=T,!.
date_month(List,Month,Date):-date_month(List,[],Month,Date),!.
date_month([32|T],Buf,Month,T):-append1(Buf,[32],Month),!.
date_month([H|T],Buf,Month,Date):-H<123,H>96,append1(Buf,[H],Buf1),date_month(T,Buf1,Month,Date),!.
date_year([H1,H2,H3,H4|T],Buf,Date):-H1<58,H1>47,H2>47,H2<58,H3>47,H3<58,H4>47,H4<58,
								   Buf=[H1,H2,H3,H4],Date = T,!.

		%______________4.2______________
all_lat:-see('c:/Users/danna/Desktop/input.txt'),read_str(S,_,1),seen,all_lat(S,[],S1),write_str(S1).
all_lat([],S,S):-!.
all_lat([H|T],Buf,Str):-(H<123,H>96;H=32),append1(Buf,[H],Buf1),all_lat(T,Buf1,Str),!.
all_lat([_|T],Buf,Str):-all_lat(T,Buf,Str).

		%______________4.10______________
involved_simb:-see('c:/Users/danna/Desktop/input.txt'),read_str(A,_,0),seen,involved_simb(A,[],Str),write_str(Str).
involved_simb([],Str,Str):-!.
involved_simb([32|T],Buf,Str):-involved_simb(T,Buf,Str),!.
involved_simb([H|T],Buf,Str):-in_list_(Buf,H),involved_simb(T,Buf,Str),!.
involved_simb([H|T],Buf,Str):-append(Buf,[H],Buf1),involved_simb(T,Buf1,Str).

		%______________4.17______________ - 2.17

		%______________5______________
order_str_length:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(A),seen,
				  order_str_length(A,[],List),write_list_str(List).
order_str_length([],List,List):-!.
order_str_length([H|T],Buf,ListStr):-max_l_w([H|T],0,K,H,StrokaMax),append1(Buf,[StrokaMax],Buf1),
						remove_str([H|T],StrokaMax,NList),order_str_length(NList,Buf1,ListStr),!.
order_str_length([H|T],Buf,ListStr):-order_str_length(T,Buf,ListStr).

max_l_w([],K,K,S,S):-!.
max_l_w([H|T],K,Kol,S,StrokaMax):-length_word(H,L),(L>K -> K1 is L,S1=H,max_l_w(T,K1,Kol,S1,StrokaMax);
								  max_l_w(T,K,Kol,S,StrokaMax)).

remove_str([H1|T1],X,List):-remove_str([H1|T1],[],List,X).
remove_str([],List2,List2,_):-!.
remove_str([H1|T1],Buffer,List2,X):-(H1=X -> remove_str(T1,Buffer,List2,X);
									append1(Buffer,[H1],Buffer1),remove_str(T1,Buffer1,List2,X)).

		%______________6______________
 order_str_kol_word:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(A),seen,
							list_strok_in_word(A,[],List),order_str_length(List,[],OrList),
							write_list_str_(OrList).

write_list_str_([]):-!.
write_list_str_([H|T]):-write_list_str1(H),nl,write_list_str_(T).

write_list_str1([]):-!.
write_list_str1([H|T]):-write_str(H),write(" "),write_list_str1(T).

list_strok_in_word([],L,L):-!.			
list_strok_in_word([H|T],Buf,List):-list_words(H,ListWordInStrok),append1(Buf,[ListWordInStrok],Buf1),
						list_strok_in_word(T,Buf1,List).

list_strok(A,LW):-append1([32],A,A1),reverse(A1,AR),list_strok(AR,[],LW,[]).
list_strok([],LW,LWN,W):-append1([W],LW,LWN),!.
list_strok([H|T],LW,LWN,W):-(H=10 -> append1([W],LW,LW1),list_strok(T,LW1,LWN,[]);
						 append1([H],W,W1),list_strok(T,LW,LWN,W1)).

list_strings(A,LW):-append1(A,[32],Apr),list_strings(Apr,[],LW,[]).
list_strings([],LW,LW,_):-!.
list_strings([H|T],LW,LWN,W):-(H=10 -> append1(LW,[W],LW1),list_strings(T,LW1,LWN,[]);
						 append1(W,[H],W1),list_strings(T,LW,LWN,W1)).

		%______________7______________
list_word_after_num([],ListAfterNum,ListAfterNum):-!.
list_word_after_num([[H|T1]|T],Buf,ListAfterNum):-(H>47,H<58 -> list_word_after_num(T,[],ListAfterNum);
											append1(Buf,[[H|T1]],Buf1),list_word_after_num(T,Buf1,ListAfterNum)).

k_after_num([],K,K,S,S):-!.
k_after_num([H|T],K,Kol,S,StrokaMax):-list_word_after_num(H,[],H1),length_word(H1,L),(L>K -> K1 is L,S1=H,
								  k_after_num(T,K1,Kol,S1,StrokaMax);k_after_num(T,K,Kol,S,StrokaMax)).

sort_after_num:-see('c:/Users/danna/Desktop/input.txt'),read_list_str(A),seen,list_strok_in_word(A,[],ListS),
				  sort_after_num(ListS,[],List),write_list_str_(List).
sort_after_num([],List,List):-!.
sort_after_num([H|T],Buf,ListStr):-k_after_num([H|T],0,K,H,StrokaMax),append1(Buf,[StrokaMax],Buf1),
						remove_str([H|T],StrokaMax,NList),sort_after_num(NList,Buf1,ListStr),!.
sort_after_num([H|T],Buf,ListStr):-sort_after_num(T,Buf,ListStr).

n:-nodebug.