%Traitement sur des listes
%Predicat retirer3d(L,Lmoins3) qui permet de vérifier que la liste Lmoins3 est obtenue en retirant les trois derniers éléments de la liste L
retirer3d([X,Y,Z],[]):-!.
retirer3d([X|Y],[X|Z]):- retirer3d(Y, Z).

%Predicat adjacents(X,Y,L) qui vérifie que les éléments X et Y se suivent immédiatement dans la liste L
adjacents(X,Y,[X,Y|Z]).
adjacents(X,Y,[_|Q]):-adjacents(X,Y,Q).

%Predicat partage(L,X,L1,L2) qui étant donné une lite L composée uniquement de nombres, et un nombre X, crée une liste L1 avec les éléments de L qui sont strictement inférieurs à X, et une liste L2 avec les éléments de L qui sont supérieurs ou égales à X.
partage([],X,[],[]):-!.
partage([L|Q],X,[L|B],L2):- L<X,partage(Q,X,B,L2).
partage([L|Q],X,L1,[L|B]):- L>=X,partage(Q,X,L1,B).

%Jeu Echec
%Predicat non récursif saut(X/Y, X1/Y1) permettant de trouver tous les déplacements X1/Y1 valides en un coup d’un cavalier dans le jeu d’échecs en partant de la position initiale X/Y
saut(X/Y, X1/Y1) :-
  (
    ((X1 is (X+2) ; X1 is(X-2)) , (Y1 is (Y+1) ; Y1 is (Y-1)))
    ;
    ((Y1 is (Y+2) ; Y1 is(Y-2)) , (X1 is (X+1) ; X1 is (X-1)))
  )
  ,(X1>=1, Y1>=1 , X1=<8, Y1=<8).


%Predicat mvt_cav qui permet de calculer à partir d’une position initiale tous les déplacements valides d’un cavalier en 1 coup, 2 coups, 3 coups, etc.
mvt_cav([_]).
mvt_cav([A, T|Q]) :- saut(A, T), mvt_cav([T|Q]).


%Cryptaritme
%Predicat chiffre(X) est un prédicat qui renvoie Yes si X est un chiffre de 0 à 9
chiffre(X) :- X>=0, X=<9.

%Predicat plus(Retenue1, Chiffre1, Chiffre2, Chiffre3, Retenue2)
plus(R, C1, C2, C3, R2) :- (chiffre(C1), chiffre(C2)), (R2 =:= (R1))
