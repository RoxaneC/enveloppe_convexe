% usage : coord = direction_vect(p1,p2)
%
% Renvoie les coordonnées de direction du vecteur p1->p2

% Version : 1.0
% Author : Cellier R.

function [a,b] = direction_vect(p1,p2)
  a = p2(1)-p1(1);
  b = p2(2)-p1(2);
endfunction
