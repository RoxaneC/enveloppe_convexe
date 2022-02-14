% definit le chemin et trace l'enveloppe convexe d'un ensemble de N points
% dont les coordonnées sont tirées aléatoirement et de façon uniforme dans le
% carré [0,1]*[0,1] (pour l'instant, à venir : decider des intervalles)
function convexe = convexe(N)
  # tirage des coordonnées
  X = rand(1,N);
  Y = rand(1,N);

  # affiche l'ensemble des points de coordonnées (x,y)
  figure; subplot(1,2,1)
  plot(X,Y, '+'); axis("square");

  # defini les coordonnées du point le plus à gauche (abscisse la plus petite)
  P_Gauche = [X(min(X)==X), Y(min(X)==X)];
  # defini les coordonnées du point le plus à droite (abscisse la plus grande)
  P_Droite = [X(max(X)==X), Y(max(X)==X)];

  # voir chemin_convexe_haut
  convexeH = chemin_convexe_haut(P_Gauche, P_Droite, X,Y);
  # voir chemin_convexe_bas
  convexeB = chemin_convexe_bas(P_Gauche, P_Droite, X,Y);
  # assemble les chemins haut et bas pour former le chemin final de l'enveloppe
  # convexe (par convention, le point de départ est le point le plus à gauche)
  convexe = [convexeH(1:end-1,:);convexeB(end:-1:1,:)];

  # affiche l'ensemble des points et trace l'enveloppe convexe
  subplot(1,2,2)
  plot(X,Y, '+');
  axis("square"); hold on;
  plot(convexe(1:end,1), convexe(1:end,2),'r-');
endfunction