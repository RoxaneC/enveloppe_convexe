% Renvoie les coordonnées de direction du vecteur p1->p2
function [a,b] = vect(p1,p2)
  a = p2(1)-p1(1);
  b = p2(2)-p1(2);
endfunction