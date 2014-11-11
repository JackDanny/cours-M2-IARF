%calcul du score pour une loi normale

%ci matrice de covariance

%mi vecteur moyenne

%vi vecteur a comparer

function[sc] = score(mi,ci,vi)


s1=log(det(ci));

s2=(vi - mi) * inv(ci) * (vi- mi)';

sc= s1+s2;








