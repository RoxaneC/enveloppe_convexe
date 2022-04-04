% usage : coord = projete_ortho(p,p1,p2)
%
% Renvoie les coordonnées du projeté orthogonal de p sur le segment [p1,p2]

% Version : 1.0
% Author : Cellier R.

function [x_proj,y_proj] = projete_ortho(p,p1,p2)
  # on considère le vecteur (p1->p2) et le vecteur à projeter (p1->p)
  [x_vect1, y_vect1] = vect(p1,p2);
  [x_vect2, y_vect2] = vect(p1,p);
  
  # calcule le produit scalaire des deux vecteurs considérés (p1->p) et (p1->p2)
  scal = dot([x_vect1, y_vect1],[x_vect2, y_vect2]);
  # calcule la norme au carré du vecteur (p1->p2)
  norm_carre = x_vect1^2 + y_vect1^2;
  
  # calcule les coordonnées du vecteur projeté d'après sa definition mathématique
  proj_vect = [x_vect1, y_vect1] .* scal/norm_carre;
  
  # calcule les coordonnées du point projeté d'après les coordonnées du
  # vecteur projeté
  x_proj = proj_vect(1) + p1(1);
  y_proj = proj_vect(2) + p1(2);
endfunction
