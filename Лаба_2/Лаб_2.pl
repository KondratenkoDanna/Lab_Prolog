q(1,juzo,1).
q(1,youshimura,0).
q(1,seido,0).
q(1,arima,1).
q(1,toyka,0).
q(1,yomo,0).
q(1,kaneki_ken,0).
q(1,akira_mado,1).
q(1,matsuri_washu,1).
q(1,big_madam,0).
q(1,brothers_bin,0).
q(1,naki,0).
q(1,donato_porporo,0).
q(1,noro,0).
q(1,iwai_kuroiwa,1).
q(1,amon_kotaro,1).
q(1,saiko_yonebayashi,1).
q(1,kano,1).
q(1,kuki_urie,1).
q(1,tataro,1).

q(2,juzo,0).
q(2,youshimura,1).
q(2,seido,1).
q(2,arima,1).
q(2,toyka,1).
q(2,yomo,1).
q(2,kaneki_ken,0).
q(2,akira_mado,1).
q(2,matsuri_washu,0).
q(2,big_madam,0).
q(2,brothers_bin,1).
q(2,naki,1).
q(2,donato_porporo,1).
q(2,noro,0).
q(2,iwai_kuroiwa,1).
q(2,amon_kotaro,0).
q(2,saiko_yonebayashi,0).
q(2,kano,0).
q(2,kuki_urie,0).
q(2,tataro,1).

q(3,juzo,1).
q(3,youshimura,0).
q(3,seido,1).
q(3,arima,0).
q(3,toyka,1).
q(3,yomo,1).
q(3,kaneki_ken,1).
q(3,akira_mado,1).
q(3,matsuri_washu,0).
q(3,big_madam,0).
q(3,brothers_bin,0).
q(3,naki,0).
q(3,donato_porporo,0).
q(3,noro,0).
q(3,iwai_kuroiwa,0).
q(3,amon_kotaro,1).
q(3,saiko_yonebayashi,1).
q(3,kano,0).
q(3,kuki_urie,1).
q(3,tataro,0).

q(4,juzo,1).
q(4,youshimura,0).
q(4,seido,0).
q(4,arima,1).
q(4,toyka,0).
q(4,yomo,0).
q(4,kaneki_ken,0).
q(4,akira_mado,1).
q(4,matsuri_washu,1).
q(4,big_madam,0).
q(4,brothers_bin,0).
q(4,naki,0).
q(4,donato_porporo,0).
q(4,noro,0).
q(4,iwai_kuroiwa,1).
q(4,amon_kotaro,1).
q(4,saiko_yonebayashi,1).
q(4,kano,1).
q(4,kuki_urie,1).
q(4,tataro,0).

q(5,juzo,0).
q(5,youshimura,0).
q(5,seido,0).
q(5,arima,0).
q(5,toyka,0).
q(5,yomo,0).
q(5,kaneki_ken,0).
q(5,akira_mado,0).
q(5,matsuri_washu,0).
q(5,big_madam,0).
q(5,brothers_bin,0).
q(5,naki,0).
q(5,donato_porporo,0).
q(5,noro,0).
q(5,iwai_kuroiwa,0).
q(5,amon_kotaro,1).
q(5,saiko_yonebayashi,1).
q(5,kano,0).
q(5,kuki_urie,1).
q(5,tataro,0).

q(6,juzo,0).
q(6,youshimura,1).
q(6,seido,0).
q(6,arima,0).
q(6,toyka,1).
q(6,yomo,1).
q(6,kaneki_ken,1).
q(6,akira_mado,0).
q(6,matsuri_washu,0).
q(6,big_madam,0).
q(6,brothers_bin,0).
q(6,naki,1).
q(6,donato_porporo,0).
q(6,noro,0).
q(6,iwai_kuroiwa,0).
q(6,amon_kotaro,0).
q(6,saiko_yonebayashi,0).
q(6,kano,0).
q(6,kuki_urie,0).
q(6,tataro,0).

q(7,juzo,0).
q(7,youshimura,1).
q(7,seido,0).
q(7,arima,1).
q(7,toyka,1).
q(7,yomo,0).
q(7,kaneki_ken,1).
q(7,akira_mado,1).
q(7,matsuri_washu,1).
q(7,big_madam,0).
q(7,brothers_bin,0).
q(7,naki,0).
q(7,donato_porporo,1).
q(7,noro,0).
q(7,iwai_kuroiwa,0).
q(7,amon_kotaro,1).
q(7,saiko_yonebayashi,0).
q(7,kano,0).
q(7,kuki_urie,0).
q(7,tataro,0).

q(8,juzo,0).
q(8,youshimura,0).
q(8,seido,1).
q(8,arima,0).
q(8,toyka,0).
q(8,yomo,0).
q(8,kaneki_ken,0).
q(8,akira_mado,0).
q(8,matsuri_washu,0).
q(8,big_madam,0).
q(8,brothers_bin,1).
q(8,naki,0).
q(8,donato_porporo,1).
q(8,noro,1).
q(8,iwai_kuroiwa,0).
q(8,amon_kotaro,0).
q(8,saiko_yonebayashi,0).
q(8,kano,1).
q(8,kuki_urie,0).
q(8,tataro,1).

persons([juzo,youshimura,seido,arima,toyka,yomo,kaneki_ken,akira_mado,matsuri_washu,big_madam,brothers_bin,naki,
donato_porporo,noro,iwai_kuroiwa,amon_kotaro,saiko_yonebayashi,kano,kuki_urie,tataro]).

question(1,X):-write("This is a human?"),nl,
	write("1. Yes"),nl,
	write("0. NO"),nl,
	read(X).

question(2,X):-	write("The family is alive?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(3,X):-	write("Person is alive?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(4,X):-	write("Works in CCJ?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(5,X):-	write("This is Quincy?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(6,X):-	write("They were members of the black goat?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(7,X):-	write("The person read books?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

question(8,X):-	write("He was members of the aogiri tree?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X).

pr:-persons(X),pr(1,X).
pr(N,ListG):-question(N,X),check(N,X,ListG,[],ListG1),(alone(ListG1)->writeH(ListG1),!;N1 is N+1,pr(N1,ListG1)).

check(_,_,[],Buffer,Buffer):-!.
check(N,X,[Cur|Tail],Buffer,ListG1):-(q(N,Cur,X)->check(N,X,Tail,[Cur|Buffer],ListG1);check(N,X,Tail,Buffer,ListG1)).

alone([_|Notalone]):-Notalone=[].
writeH([H|_]):-write(H).





