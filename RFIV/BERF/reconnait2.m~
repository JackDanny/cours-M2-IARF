%permet de classer un ensemble de vecteurs d'observations y dans l'une des classes
%précédemment apprises. Il affiche, pour chacun des vecteurs, sa classe réelle d'appartenance et 
%la classe reconnue.


function[sc] = reconnait2(mi,ci,vi)


s1=log(det(ci));

s2=(vi - mi) * inv(ci) * (vi- mi)';

sc= s1+s2;








