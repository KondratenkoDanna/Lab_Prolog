man(yura).
man(danil).
man(fyodor).
man(misha).
man(kazimir).
man(david).
man(roma).
man(ivan).
man(leon).
man(mark).

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
woman(sara).
woman(tina).

parent(yura,danil).
parent(yura,fyodor).
parent(yura,misha).
parent(yura,maria).
parent(yura,sara).
parent(yura,tina).

parent(mila,danil).
parent(mila,fyodor).
parent(mila,misha).
parent(mila,maria).
parent(mila,sara).
parent(mila,tina).

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

parent(leon,miroslava).
parent(leon,mark).
parent(emma,miroslava).
parent(emma,mark).

parent(ivan,zlata).
parent(kira,zlata).

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

grand_pa_and_son(X,Y):-grand_so(X,Y);grand_pa(X,Y).

grand_pa_and_da(X,Y):-woman(X),man(Y),parent(Y,Z),parent(Z,X);woman(Y),man(X),parent(X,Z),parent(Z,Y).

uncle(X,Y):-man(X),parent(Z,Y),(brother(Z,X);sister(Z,X)),Z\=X.

aunt(X,Y):-woman(X),parent(Z,Y),(sister(Z,X);brother(Z,X)),Z\=X.
aunts(X):-aunt(Y,X),write(Y),nl,fail.