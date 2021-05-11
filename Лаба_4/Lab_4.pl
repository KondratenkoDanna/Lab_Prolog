		%_____1_____
read_list(0,[]):-!.
read_list(N,[H|T]):-read(H),N1 is N-1,read_list(N1,T).

		%_____2_____
write_list([]):-!.
write_list([H|T]):-write(H),write(" "),write_list(T).

		%_____3_____
sum_list_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],S,Sum):-S1 is H + S,sum_list_down(T,S1,Sum).

		%_____4_____
sum_list_up([],0):-!.
sum_list_up([H|T],S):-sum_list_up(T,S1),S is S1+H.

		%_____4_____
list_el_num([H|T],El,Num):-list_el_num([H|T],El,Num,0).
list_el_num([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num = Chet1 -> !;list_el_num(T,El,Num,Chet1)).

		%_____5_____
list_entry_el([H|T],El,Num):-list_entry_el([H|T],El,Num,0).
list_entry_el([],_,_,_):-write("The number is not in the list."),!.
list_entry_el([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num = Chet1 -> !;list_entry_el(T,El,Num,Chet1)).

		%_____6_____
list_entry_num([H|T],El,Num):-list_entry_num4([H|T],El,Num,0).
list_entry_num4([],_,_,_):-write("The number does not exist in the list."),!.
list_entry_num4([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num = Chet1 -> !;list_entry_num4(T,El,Num,Chet1)).

		%_____7_____
min_list_down([H|T],Min):-min_list_down([H|T],9,Min).
min_list_down([],Min,Min):-!.
min_list_down([H|T],M,Min):-(H<M -> M1 is H,min_list_down(T,M1,Min);
		            min_list_down(T,M,Min)).

		%_____8_____
min_list_6:-read(N),read_list(N,List),min_list_down(List,Min),write(Min),!.

		%_____9_____
in_list([H|T],X):-(X=H -> !;in_list(T,X)).

		%_____10_____
reverse_list:-read(N),read_list(N,List),reverse_list(List,ListR),write_list(ListR).
reverse_list(List,ListR):-reverse_list(List,[],ListR).
reverse_list([],Buffer,Buffer):-!.
reverse_list([H|T],Buffer,ListR):-reverse_list(T,[H|Buffer],ListR).

		%_____11_____
append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).
p(SubList,List):-append1(_,Y,List),append1(SubList,_,Y),!.

		%_____12_____
remove_index([H|T],InNum,NList):-remove_index([H|T],InNum,[],NList,1).
remove_index([_|T],InNum,Buffer,NList,InNum):-reverse_list(Buffer,BufferR),
										   append1(BufferR,T,NList),!.
remove_index([H|T],InNum,Buffer,NList,Counter):-Counter1 is Counter+1,
								remove_index(T,InNum,[H|Buffer],NList,Counter1).

	   	%_____13_____
remove_number([H1|T1],X,List):-remove_number([H1|T1],[],List,X).
remove_number([],Buffer,List2,_):-reverse_list(Buffer,List2),!.
remove_number([H1|T1],Buffer,List2,X):-(H1=X -> remove_number(T1,Buffer,List2,X);
								 remove_number(T1,[H1|Buffer],List2,X)).
			
		%_____14_____
repeat([]).
repeat([H|T]):-in_list(T,H) -> fail,!;repeat(T).

		%_____15_____
unique_list1(List,UList):-reverse_list(List,ListR),unique_list(ListR,[],UList).
unique_list([],UList,UList):-!.
unique_list([H|T],Buffer,UList):-(in_list(T,H) -> unique_list(T,Buffer,UList);
								  unique_list(T,[H|Buffer],UList)).

		%_____16_____
kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);
									kol_repeat_in_list(T,X,K,Kol)).

		%_____17_____
length_list([],0):-!.
length_list([_|T],L):-length_list(T,L1),L is L1+1.

		%_____18.7_____
cycle([H1|[H2|T]],C):-append1(T,[H1],Buffer),append1(Buffer,[H2],C).

		%_____18.8_____
index_2_min([H|T],In1,In2):-min_list_down([H|T],Min1),list_el_num([H|T],Min1,In1),
			remove_index([H|T],In1,NList),min_list_down(NList,Min2),list_el_num(NList,Min2,In2).

		%_____18.18_____
first_before_min([H|T],List):-min_list_down([H|T],Min),first_before_min([H|T],[],List,Min).
first_before_min([Min|_],List,ListR,Min):-reverse_list(List,ListR),!.
first_before_min([H|T],Buffer,List,Min):-first_before_min(T,[H|Buffer],List,Min).

		%_____18.20_____найти все пропущенные числа
max_list_down([H|T],Min):-max_list_down([H|T],0,Min).
max_list_down([],Min,Min):-!.
max_list_down([H|T],M,Min):-(H>M -> M1 is H,max_list_down(T,M1,Min);
		            min_list_down(T,M,Min)).

skip_num([H|T],List):-max_list_down([H|T],Max),skip_num([H|T],0,Max,[],List).
skip_num([H|T],Max,Max,List,List):-!.
skip_num([H|T],Counter,Max,Buffer,List):-Counter1 is Counter+1,(in_list([H|T],Counter1)->
									 skip_num([H|T],Counter1,Max,Buffer,List);
									 append1([Counter1],Buffer,NBuffer),skip_num([H|T],Counter1,Max,NBuffer,List)).						 .

		%_____18.32_____кол. локальных максимумов
kol_loc_max([H1|[H2|[H3|T]]],Kol):-kol_loc_max([H1|[H2|[H3|T]]],0,Kol).
kol_loc_max([H1|[H2|[]]],Kol,Kol):-!.
kol_loc_max([H1|[H2|[H3|T]]],K,Kol):-(H2>H1,H2>H3 -> K1 is K+1,kol_loc_max([H2|[H3|T]],K1,Kol);
								   kol_loc_max([H2|[H3|T]],K,Kol)).

		%_____18.35_____найти ближайшее к введенному вещ.числу
closest([H|T],R,El):-K is abs(H-R),closest(T,R,K,H,El).
closest([],R,K,El,El):-!.
closest([H|T],R,K,PEl,El):-K1 is abs(H-R),
					(K1<K -> closest(T,R,K1,H,El);closest(T,R,K,PEl,El)).

		%_____18.38_____массив и а,б.найти кол.эл. принадлежащих этому отрезку.
section([H|T],A,B,Kol):-section([H|T],A,B,0,Kol).
section([],_,_,Kol,Kol):-!.
section([H|T],A,B,K,Kol):-(H>=A,H=<B->K1 is K+1,section(T,A,B,K1,Kol);section(T,A,B,K,Kol)).

		%_____18.44_____чередуются ли целые и вещ. числа
rotation([_]):-!.
rotation([H1|[H2|T]]):-(integer(H1) ->  float(H2);integer(H2)),rotation([H2|T]).

		%_____18.56_____
simple(1):-!,fail.
simple(X):-N is X div 2 + 1,simple(X,2,N).
simple(_,N,N):-!.
simple(X,Cur,N):-M is X mod Cur,M\=0,NCur is Cur+1,simple(X,NCur,N).

sr_ar([H|T],SrArPr):-sr_ar([H|T],0,S_Pr,0,Counter),SrArPr is S_Pr/Counter.
sr_ar([],S_Pr,S_Pr,Counter,Counter):-!.
sr_ar([H|T],SumPr,S_Pr,Count,Counter):-(simple(H) -> SumPr1 is SumPr+H,Count1 is Count+1,
									   sr_ar(T,SumPr1,S_Pr,Count1,Counter);sr_ar(T,SumPr,S_Pr,Count,Counter)).

sr_ar_npr([H|T],Sr_ar):-sr_ar([H|T],SrArPr),sr_ar_npr([H|T],SrArPr,0,Kol,0,Sum_npr),Sr_ar is Sum_npr/Kol.
sr_ar_npr([],_,Kol,Kol,Sum_npr,Sum_npr):-!.
sr_ar_npr([H|T],SrArPr,K,Kol,S,Sum_npr):-(not(simple(H)),H>SrArPr->S1 is S+H,K1 = K+1,
								  sr_ar_npr(T,SrArPr,K1,Kol,S1,Sum_npr);sr_ar_npr(T,SrArPr,K,Kol,S,Sum_npr)).

n:-nodebug.

