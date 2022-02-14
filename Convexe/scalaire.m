% Renvoie le produit scalaire de deux vecteurs v1 et v2
function s = scalaire(v1,v2)
  s = sum(v1 .* v2);
endfunction