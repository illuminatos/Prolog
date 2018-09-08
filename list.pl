

member(X,[X|T]).
member(X,[H|T]) :- member(X,T).  /* member(a,[c,v,b,f,j]). */



/*Recursing down list*/

a2b([],[]).
a2b([a|Ta],[b|Tb]) :- a2b(Ta,Tb).

/*--------------------------------------------------------------------------------*/

/*Suppose we are given a knowledge base with the following facts:*/

/*Write a predicate listtran(G,E) which translates a list of German number words to the corresponding */
/*list of English number words. For example:*/

/*listtran([eins,neun,zwei],X).*/
/*should give:*/

/*X = [one,nine,two].*/
/*Your program should also work in the other direction. For example, if you give it the query*/

/*listtran(X,[one,seven,six,two]).*/
/*it should return:*/

/*X = [eins,sieben,sechs,zwei].*/

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([],[]).
listtran([X|T0],[Y|T1]) :- tran(X,Y), listtran(T0,T1).


/*-------------------------------------------------------------------------------------------------------------*/


/*Write a predicate twice(In,Out) whose left argument is a list, and whose right argument is a list consisting of*/
/*every element in the left list written twice. For example, the query*/

/*twice([a,4,buggle],X).*/
/*should return*/

/*X = [a,a,4,4,buggle,buggle]).*/
/*And the query*/

/*twice([1,2,1,1],X).*/
/*should return*/

/*X = [1,1,2,2,1,1,1,1].*/


twice([],[]).
twice([X|T0],[X,X|T1]) :- twice(T0,T1).



/*Write a 3-place predicate combine1 which takes three lists as arguments and combines the elements of the first two lists */
/*into the third as follows:*/

/*?- combine1([a,b,c],[1,2,3],X).*/
 
/*X = [a,1,b,2,c,3]*/

combine1([],[],[]).

combine1([H1|T1],[H2|T2],[H1,H2|T3]) :- combine1(T1,T2,T3).


/*write a 3-place predicate combine2 which takes three lists as arguments and combines the elements of the first two */
/*lists into the third as follows:*/

/*?- combine2([a,b,c],[1,2,3],X).*/
 
/*X = [[a,1],[b,2],[c,3]]*/

combine2([],[],[]).

combine2([H1|T1],[H2|T2],[[H1,H2]|T3]) :- combine2(T1,T2,T3).



/*write a 3-place predicate combine3 which takes three lists as arguments and combines the elements of the first two */
/*lists into the third as follows:*/

/*?- combine3([a,b,c],[1,2,3],X).*/
 
/*X = [join(a,1),join(b,2),join(c,3)]*/

combine3([],[],[]).

combine3([H1|T1],[H2|T2],[join(H1,H2)|T3]) :- combine3(T1,T2,T3).


/*Write a predicate mysubset2 that takes two lists (of constants) as arguments and checks,*/
/*whether the first list is a subset of the second.*/

mysubset([], _).

mysubset([X|Xs], [X|Ys]) :- mysubset(Xs, Ys).

mysubset([X|Xs], [_|Ys]) :- mysubset([X|Xs], Ys).



/*List aritmetics*/

len([],0).

len([_|T],N) :- len(T,X), N is X + 1.

/*Another version of finding length*/

acclength([_|T],A,L) :- Anew is A+1, acclength(T,Anew,L).
acclength([], A, A).



/*Find max element of the list*/

accmax([H|T],A,R) :- H =< A, accmax(T,A,R).

accmax([H|T],A,R) :- H > A, accmax(T,H,R). 

accmax([],A,A).

/*tail recursive*/

max(List,Max) :- List = [H|_], accmax(List,H,Max).


/*Define a 2-place predicate increment that holds only when its second argument is an */
/*integer one larger than its first argument. For example, increment(4,5) should hold, but increment(4,6) should not.*/

increment(X,Y) :- Y is X + 1.

/*Define a 3-place predicate sum that holds only when its third argument is the sum of the first two arguments. */
/*For example, sum(4,5,9) should hold, but sum(4,6,12)should not.*/

sum(X,Y,Z) :- Z is X + Y.


/*Write a predicate addone2 whose first argument is a list of integers, and whose second argument is the list of */
/*integers obtained by adding 1 to each integer in the first list. For example, the query*/

       /* addone([1,2,7,2],X).*/
/*should give*/

        /*X = [2,3,8,3].*/


addone2([],[]).

addone2([H1|T1],[H2|T2]) :- H2 is H1 + 1, addone2(T1,T2).        


/*predicate accMin which returns the minimum of a list of integers.*/

accmin([H1|T],A,R) :- H1 < A, accmin(T,H1,R).

accmin([H1|T],A,R) :- H1 >= A, accmin(T,A,R).

accmin([],A,A).

min(List,Min) :- List = [H1|_], accmin(List,H1,Min).



/*3-place predicate scalarMult whose first argument is an integer, whose second argument is a list of integers, */
/*and whose third argument is the result of scalar multiplying the second argument by the first. For example, the query*/

/*scalarMult(3,[2,7,4],Result).*/
/*should yield*/

/*Result = [6,21,12]*/

scalarMult(X,[],[]).

scalarMult(X,[H|T],[H1|T1]) :- H1 is H * X, scalarMult(X,T,T1).



/*the dot product of [2,5,6] and [3,4,1] is 6+20+6, that is, 32. Write a 3-place predicate dot whose first */
/*argument is a list of integers, whose second argument is a list of integers of the same length as the first, */
/*and whose third argument is the dot product of the first argument with the second. For example, the query*/

/*dot([2,5,6],[3,4,1],Result).*/
/*should yield*/

/*Result = 32*/

dot([],[],0).

dot([H1|T1],[H2|T2],R) :- dot(T1,T2, N ), R is N + H1 * H2.



/*Append*/

append1([],L2,L2).

append1([H|L1],L2,[H|L3]) :- append1(L1,L2,L3).


/*Prefix-Suffix*/

prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

/*sublist*/

sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).


/*Reverse a list*/

/*using accumulator*/

accrev([H|T], Acc, Result) :- accrev(T,[H|Acc],Result).
accrev([],Acc,Acc).

rev(L,Result) :- accrev(L,[],Result).


/*Let's call a list doubled if it is made of two consecutive blocks of elements that are exactly the same. */
/*For example, [a,b,c,a,b,c] is doubled (it's made up of [a,b,c]followed by [a,b,c]) and so is [foo,gubble,foo,gubble]. */
/*On the other hand, [foo,gubble,foo] is not doubled. Write a predicate doubled(List) which succeeds when List is a doubled list. */


doubled(List) :- append(X, X, List).


/*A palindrome is a word or phrase that spells the same forwards and backwards. For example, `rotator', `eve', and `nurses run' */
/*are all palindromes. Write a predicate palindrome(List), which checks whether List is a palindrome. For example, to the queries*/

/*?- palindrome([r,o,t,a,t,o,r]).*/
/*and*/

/*?- palindrome([n,u,r,s,e,s,r,u,n]).*/
/*Prolog should respond `yes', but to the query*/

/*?- palindrome([n,o,t,h,i,s]).*/
/*Prolog should respond `no'.*/

accrev1([H|T],Acc,Result) :- accrev1(T,[H|Acc],Result).
accrev1([],Acc,Acc).

revtail(List,Result) :- accrev1(List,[],Result).

palindrome(List) :- revtail(List,List).

/*Write a predicate second(X,List) which checks whether X is the second element of List.*/

findsecond([_,X|T],X).

second(X,List) :- findsecond(List,X).


/*Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2, */
/*except that the first two elements are exchanged.*/

swap12([],[]).
swap12([X,Y|T],[Y,X|T]).


/*Write a predicate final(X,List) which checks whether X is the last element of List.*/

accrev2([H|T],Acc,R) :- accrev2(T,[H|Acc],R).
accrev2([],Acc,Acc).

rev2(List,R) :- accrev2(List,[],R).

final(X,List) :- rev2(List,[X|T]).



/*Write a predicate toptail(InList,Outlist) which says `no' if inlist is a list containing fewer than 2 elements, */
/*and which deletes the first and the last elements of Inlist and returns the result as Outlist,  */
/*when Inlist is a list containing at least 2 elements. For example: */

   /* toptail([a],T). */
  /*  no */
   
    /*toptail([a,b],T). */
   /* T=[] */
  
   /* toptail([a,b,c],T). */
    /*T=[b]  */


toptail([_|T],R) :- append(R,[_],T).


/*Write a predicate swapfl(List1,List2) which checks whether List1 is identical to List2, */
/*except that the first and last elements are exchanged. Hint: here's where append comes in useful again.*/


swapf1([H|T],List2) :- append(S1,[L],T), append([L],S1,List3), append(List3,[H],List2).



/*There is a street with three neighboring houses that all have a different color. They are red, blue, */
/*and green. People of different nationalities live in the different houses and they all have a different pet. */
/*Here are some more facts about them:*/

/*The Englishman lives in the red house.*/

/*The jaguar is the pet of the Spanish family.*/

/*The Japanese lives to the right of the snail keeper.*/

/*The snail keeper lives to the left of the blue house.*/

/*Who keeps the zebra?*/

/*Define a predicate zebra1 that tells you the nationality of the owner of the zebra.*/


neighboring(A,B,[A,B|_]).
neighboring(A,B,[_|T]) :- neighboring(A,B,T).


zebra1(X) :- member(house(red,english,_),[A1,A2,A3]),
			 member(house(_,spanish,jaguar),[A1,A2,A3]),
			 neighboring(house(_,japanese,_),house(_,_,snail),[A1,A2,A3]),
			 neighboring(house(_,_,snail),house(blue,_,_),[A1,A2,A3]),
			 member(house(_,X,zebra),[A1,A2,A3]).




/*Write a predicate set(InList,OutList) which takes as input an arbitrary list, and returns a list in which*/ 
/*each element of the input list appears only once. For example, the query*/ 

  
/*set([2,2,foo,1,foo, [],[]],X).  */ 
/*should yield the result*/ 

  
/*X = [2,foo,1,[]].*/

member(A,[A|_]).
member(A,[_|T]) :- member(A,T).

set([],[]).

set([H|T],Result) :- member(H,T),
					 set(T,Result).

set([H|T],[H|T2]) :- not(member(H,T)),
					 set(T,T2).				


/*We `flatten' a list by removing all the square brackets around any lists it contains as elements, */
/*and around any lists that its elements contain as element, and so on for all nested lists. For example, */
/*when we flatten the list*/

/*[a,b,[c,d],[[1,2]],foo]*/
/*we get the list*/

/*[a,b,c,d,1,2,foo]*/
/*and when we flatten the list*/

/*[a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]]*/
/*we also get*/

/*[a,b,c,d,1,2,foo].*/
/*Write a predicate flatten(List,Flat) that holds when the first argument List flattens to the second */
/*argument Flat. This exercise can be done without making use of append.		*/


accflatten([],Acc,Acc).

accflatten([A|B],Acc,R) :-  is_list(A), accflatten(A,Acc,New), accflatten(B,New,R).

accflatten([A|B],Acc,R) :-  not(is_list(A)), accflatten(B,[A|Acc],R). 	

flatten(List,R) :- accflatten(List,[],R).




















