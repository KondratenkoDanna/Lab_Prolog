man(yura).
man(danil).
man(fyodor).
man(misha).
man(kazimir).
man(david).
man(roma).
man(ivan).
man(leon).

woman(darina).
woman(rima).
woman(mila).
woman(zlata).
woman(avdotia).
woman(konstantina).
woman(miroslava).
woman(simona).
woman(maria).
woman(kira).
woman(emma).

parent(yura,danil).
parent(yura,fyodor).
parent(yura,misha).
parent(yura,maria).

parent(mila,danil).
parent(mila,fyodor).
parent(mila,misha).
parent(mila,maria).

parent(danil,david).
parent(danil,kazimir).
parent(zlata,david).
parent(zlata,kazimir).

parent(fyodor,darina).
parent(fyodor,roma).
parent(rima,darina).
parent(rima,roma).

parent(misha,konstantina).
parent(misha,avdotia).
parent(misha,simona).
parent(miroslava,konstantina).
parent(miroslava,avdotia).
parent(miroslava,simona).

parent(ivan,zlata).
parent(kira,zlata).
parent(leon,miroslava).
parent(emma,miroslava).

man():-man(X),write(X),nl,fail.
woman():-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-woman(X),parent(X,Y).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-man(X),parent(Y,X).
son(X):-son(Y,X),write(Y).

brother(X,Y):-man(X),mother(Z,X),mother(Z,Y),X\=Y.
brothers(X):-brother(Y,X),write(Y),nl,fail.

sister(X,Y):-woman(X),mother(Z,X),mother(Z,Y),X\=Y.
sisters(X):-sister(Y,X),write(Y),nl,fail.

b_s(X,Y):-mother(Z,X),mother(Z,Y),X\=Y.
b_s(X):-b_s(X,Y),write(Y),nl,fail.

grand_pa(X,Y):-man(X),parent(Z,Y),parent(X,Z).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

grand_so(X,Y):-man(X),grand_pa(Y,X).
grand_sons(X):-grand_so(Y,X),write(Y),nl,fail.