% usage : matrix = convexe(M)
%
% Définit (dans une matrice) le chemin et trace l'enveloppe convexe d'un ensemble
% de points stockés dans une matrice M. On va définir par convention que les points
% sont entrés ligne par ligne (i.e. la première colonne représente les coordonnées
% sur l'axe X et la seconde représente les coordonnées sur l'axes Y)

% Version : 1.2
% Author : Cellier R.

function chemin_convexe = convexe(M)
  assert(size(M,2)==2, "Les points doivent être listés dans une matrice à deux colonnes (X et Y)")
  n = size(M,1);
  
  % séparation des coordonnées des points contenus dans la matrice M
  X = M(:,1);
  Y = M(:,2);
  % affiche l'ensemble des points de coordonnées (x,y)
  figure; subplot(1,2,1)
  plot(X,Y, '+'); axis("square");
  
  if size(M,1) == 1
    chemin_convexe = M;
  else
    % defini les coordonnées du point le plus à gauche (abscisse la plus petite)
    P_Gauche = [X(min(X)==X), Y(min(X)==X)](1,:);
    % defini les coordonnées du point le plus à droite (abscisse la plus grande)
    P_Droite = [X(max(X)==X), Y(max(X)==X)](1,:);

    % voir chemin_convexe_haut
    convexeH = chemin_convexe_haut(P_Gauche, P_Droite, M);
    % voir chemin_convexe_bas
    convexeB = chemin_convexe_bas(P_Gauche, P_Droite, M);
    % assemble les chemins haut et bas pour former le chemin final de l'enveloppe
    % convexe (par convention, le point de départ est le point le plus à gauche)
    chemin_convexe = [convexeH(1:end-1,:);convexeB(end:-1:1,:)];
  end

  % affiche l'ensemble des points et trace l'enveloppe convexe
  subplot(1,2,2)
  plot(X,Y, '+');
  axis("square"); hold on;
  plot(chemin_convexe(1:end,1), chemin_convexe(1:end,2),'r-');
endfunction
