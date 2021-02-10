man(yura).
man(danil).
man(fyodor).
man(misha).
man(kazimir).
man(david).
man(roma).

woman(darina).
woman(rima).
woman(mila).
woman(zlata).
woman(avdotia).
woman(konstantina).
woman(miroslava).

parent(yura,danil).
parent(yura,fyodor).
parent(yura,misha).

parent(mila,danil).
parent(mila,fyodor).
parent(mila,misha).

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
parent(miroslava,konstantina).
parent(miroslava,avdotia).

man():-man(X),write(X),nl,fail.
woman():-woman(X),write(X),nl,fail.