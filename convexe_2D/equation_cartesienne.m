% usage : vect = equation_cartesienne(p1,p2)
%
% Renvoie le coefficient directeur et la constante de l'équation cartésienne
% de la droite passant par les points p1 et p2

% Version : 1.0
% Author : Cellier R.

function [coeff_dir, const] = equation_cartesienne(p1,p2)
  coeff_dir = (p2(2)-p1(2)) / (p2(1)-p1(1));
  const = p1(2) - p1(1)*coeff_dir;
endfunction
