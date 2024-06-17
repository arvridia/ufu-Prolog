mesmaDiag([C1,L1],[C2,L2]) :- 
    A1 is abs(L1-L2), 
    A2 is abs(C1-C2), 
    A1 is A2.

ataca([L1,C1],[L2,C2]) :- 
    L1 == L2, !; 
    C1 == C2,!;
	mesmaDiag([L1,C1],[L2,C2]),!.

parSeguro(_,[]) :- !.
parSeguro(R1,[R2],_) :- \+ataca(R1,R2),!.
parSeguro(R1,[H|T],N) :- \+ataca([R1,N],[H,N+1]), parSeguro(R1,T, N+1).


todasSeguras([],_) :- !.
todasSeguras([_],_) :- !.
todasSeguras([H|T],N) :- parSeguro(H,T,N),N1 is N+1, todasSeguras(T,N1).

gera(Min,Min,[Min]).
gera(N,Min,[N|T]) :- N<Min, N1 is N+1, gera(N1,Min,T).

n_Rainhas(Tab,Pos_Rainhas,L) :- select(Primeiro,Tab,Resto), n_Rainhas(Resto,[Primeiro|Pos_Rainhas],L).
n_Rainhas([],L,L).
n_Rainhas(N,L) :- gera(1,N,Tab), n_Rainhas(Tab,[],L), todasSeguras(L,1).
