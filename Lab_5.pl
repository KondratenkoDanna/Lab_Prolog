		%______________1______________
sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),

		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),nl,
		write(WHO1),nl,write(WHO2),nl.

				%______________2______________
fr:-Friends=[_,_,_],
		in_list(Friends,[belokurov,_]),
		in_list(Friends,[chernov,_]),
		in_list(Friends,[ryzhov,_]),
		in_list(Friends,[_,redhead]),
		in_list(Friends,[_,blonde]),
		in_list(Friends,[_,brunette]),
		not(in_list(Friends,[belokurov,blonde])),
		not(in_list(Friends,[belokurov,brunette])),
		not(in_list(Friends,[chernov,brunette])),
		not(in_list(Friends,[ryzhov,redhead])),
			write(Friends),!.

				%______________3______________
				%name,dress,shoes
girls:-Girls=[_,_,_],
		in_list(Girls,[anya,_,_]),
		in_list(Girls,[valya,_,_]),
		in_list(Girls,[_,_,white]),
		in_list(Girls,[_,_,green]),		
		in_list(Girls,[_,_,blue]),
		in_list(Girls,[_,white,_]),
		in_list(Girls,[_,green,_]),		
		in_list(Girls,[_,blue,_]),
		in_list(Girls,[natasha,_,green]),
		(
		not(in_list(Girls,[valya,_,white])),
		not(in_list(Girls,[valya,white,_])),
		in_list(Girls,[anya,blue,blue]);
		in_list(Girls,[anya,white,white])),		
			write(Girls),!.

				%______________4______________
factory:-Fact_fr=[_,_,_],
		in_list(Fact_fr,[borisov,_]),
		in_list(Fact_fr,[ivanov,_]),
		in_list(Fact_fr,[semenov,_]),
		in_list(Fact_fr,[_,tokar]),
		in_list(Fact_fr,[_,slesar]),
		in_list(Fact_fr,[_,svarshik]),
		not(in_list(Fact_fr,[semenov,tokar])),
		not(in_list(Fact_fr,[semenov,slesar])),
		not(in_list(Fact_fr,[borisov,slesar])),
			write(Fact_fr),!.

				%______________5______________
pot:-Pots=[_,_,_,_],
		in_list(Pots,[butter,_]),
		in_list(Pots,[glass,_]),
		in_list(Pots,[jug,_]),
		in_list(Pots,[bank,_]),
		in_list(Pots,[_,milk]),
		in_list(Pots,[_,limon]),
		in_list(Pots,[_,water]),
		in_list(Pots,[_,kvass]),
		not(in_list(Pots,[butter,water])),
		not(in_list(Pots,[butter,milk])),
		not(in_list(Pots,[bank,limon])),
		not(in_list(Pots,[bank,water])),

		next_to([_,limon],[jug,_],Pots),
		next_to([_,limon],[_,kvass],Pots),
		next_to([_,milk],[glass,_],Pots),
		next_to([butter,_],[glass,_],Pots),
			write(Pots),!.

				%______________6______________
man:-Young_man=[_,_,_,_],
		in_list(Young_man,[voronov,_]),
		in_list(Young_man,[pavlov,_]),
		in_list(Young_man,[levitski,_]),
		in_list(Young_man,[saharov,_]),
		in_list(Young_man,[_,dancer]),
		in_list(Young_man,[_,artist]),
		in_list(Young_man,[_,singer]),
		in_list(Young_man,[_,writer]),
		not(in_list(Young_man,[voronov,singer])),
		not(in_list(Young_man,[levitski,singer])),
		not(in_list(Young_man,[pavlov,writer])),
		not(in_list(Young_man,[pavlov,artist])),
		not(in_list(Young_man,[saharov,writer])),
		not(in_list(Young_man,[voronov,writer])),
			write(Young_man),!.

				%______________7______________//////////////
th_fr:-Athletes=[_,_,_],
		in_list(Athletes,[richard,_,_,_]),
		in_list(Athletes,[saimon,_,_,_]),
		in_list(Athletes,[maikl,_,_,_]),
		in_list(Athletes,[_,criket,_,1]),
		in_list(Athletes,[_,basketball,_,_]),
		in_list(Athletes,[_,tennis,_,_]),
		in_list(Athletes,[_,_,australia,_]),
		in_list(Athletes,[_,_,americ,_]),
		in_list(Athletes,[_,_,israeli,_]),

		in_list(Athletes,[maikl,basketball,_,_]),
		in_list(Athletes,[saimon,_,israeli,_]),
		in_list(Athletes,[_,tennis,_,_]),
		in_list(Athletes,[_,_,_,2]),
		in_list(Athletes,[_,_,_,3]),

		not(in_list(Athletes,[saimon,tennis,_,_])),
		not(in_list(Athletes,[maikl,_,americ,_])),
		not(in_list(Athletes,[_,criket,americ,_])),

		in_list(Athletes,[maikl,_,_,K1]),
		in_list(Athletes,[_,_,americ,K2]),K1<K2,
		in_list(Athletes,[saimon,_,israil,K3]),
		in_list(Athletes,[_,tennis,_,K4]),K3<K4,

			in_list(Athletes,[X,australia,_,_]), write(X),
			in_list(Athletes,[richard,Y,_,_]), write(Y),!.

				%______________8______________////////////////////////
				%name,city st,city bicycle
sr:-Students=[_,_,_,_,_],
		in_list(Students,[sergei,_,_]),
		in_list(Students,[boris,_,_]),
		in_list(Students,[leonid,_,_]),
		in_list(Students,[grigori,_,_]),
		in_list(Students,[victor,_,_]),
		in_list(Students,[_,riga,_]),
		in_list(Students,[_,penza,_]),
		in_list(Students,[_,lvov,_]),
		in_list(Students,[_,harkov,_]),
		in_list(Students,[_,moscov,_]),

		not(in_list(Students,[_,riga,riga])),
		not(in_list(Students,[_,penza,penza])),
		not(in_list(Students,[_,lvov,lvov])),
		not(in_list(Students,[_,harkov,harkov])),
		not(in_list(Students,[_,moscov,moscov])),

		in_list(Students,[sergei,_,riga]),
		in_list(Students,[boris,riga,penza]),
		in_list(Students,[victor,_,moscov]),
		in_list(Students,[grigori,_,harkov]),
		in_list(Students,[victor,lvov,_]),
		in_list(Students,[_,penza,Y]),
		in_list(Students,[leonid,Y,_]),
			
		in_list(Students,[X,moscov,_]),write(X),!.





