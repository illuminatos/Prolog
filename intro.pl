
likes(marry,wine).
likes(marry,chocolate).
likes(john,beer).
likes(john,marry).
likes(deren,wine).




likes(john,X) :- likes(marry,X). 
likes(john,X) :- likes(X,wine).		




  

  male(james1).
  male(charles1).			
  male(charles2).
  male(james2).
  male(george1).

  
  female(catherine).
  female(elizabeth).
  female(sophia).

  
  parent(charles1, james1).  
  parent(elizabeth, james1).
  parent(charles2, charles1).
  parent(catherine, charles1).
  parent(james2, charles1).
  parent(sophia, elizabeth).
  parent(george1, sophia).

  
  
  parent(P,Mother) :- parent(P,Mother),female(Mother).




/*Aritmetics*/

positive(N) :- N>0.

non-zero(N) :- N<0 ; N>0.


factorial(0,1). 

factorial(N,F) :-  
   N>0, 
   N1 is N-1, 
   factorial(N1,F1), 
   F is N * F1.





minimum(X,Y,X) :- X<Y.
minimum(X,Y,Y) :- Y<X.


func(X,Y) :- Y is (X+3)*2.
