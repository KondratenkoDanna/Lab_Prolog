write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

		%___________1___________
wr_str:-read_str(A,Length,0),write_str(A),write(","),write_str(A),write(","),
												write_str(A),write(","),write(Length).

		%___________2___________
		%___________3___________
		%___________4___________
		%___________5___________
		%___________6___________
		%___________7___________
		%___________8___________
		%___________9___________
		%___________10___________
		%___________11___________
		%___________12___________