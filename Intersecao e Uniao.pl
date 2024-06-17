eh_membro(A,[A|_]).
eh_membro(A,[_|T]) :- eh_membro(A,T).

uniao([A|_],Y,S) :- eh_membro(A,Y), uniao(A,Y,S).
uniao([A|_],Y,[A|S]) :- \+ eh_membro(A,Y), uniao(A,Y,S).
uniao([],Y,Y).

intersecao([A|B],X,_,[A|Y]) :- eh_membro(A,X), intersecao(B,X,Y).
intersecao([A|B],X,Y,_) :- \+ eh_membro(A,X), intersecao(B,X,Y).
intersecao([],_,_,[]).

regra(L1,L2,R) :- uniao(L1,L2,U), not(intersecao(L1,L2,U,R)).

remove_lista([], _, []).
remove_lista([A|J], L2, R) :- eh_membro(A, L2), !, remove_lista(J, L2, R). 
remove_lista([A|J], L2, [A|R]) :- remove_lista(J, L2, R).