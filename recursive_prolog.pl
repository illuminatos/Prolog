

child(a,b). /*b child of a*/
child(b,c).
child(c,d).
child(d,e).
child(e,f).
child(f,g).

descent(X,Y) :- child(X,Y).
descent(X,Y) :- child(X,Z), descent(Z,Y).



numeral(0).
numeral(succ(X)) :- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)) :- add(X,Y,Z).


/*russian dolls*/

directlyin(natasha, irina).			/*irina in natasha*/
directlyin(olga, natasha).
directlyin(katharina, olga).

in(X,Y) :- directlyin(X,Y).

in(X,Y) :- directlyin(X,Z), in(Z,Y).


/*transportation by train*/

directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X,Y) :- directTrain(X,Y).

travelBetween(X,Y) :- directTrain(X,Z), travelBetween(Z,Y). 

/*maze*/

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,Y) :- connected(X,Y).
path(X,Y) :- connected(X,Z), path(Z,Y).





