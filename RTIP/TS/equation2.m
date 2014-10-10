
% x1 et x2 sont des variables formels
syms x1 x2

%on definit la fonction
z = -power(x1,4) - power(x2,4)

%on calcule le gradient
g=gradient(z,[x1,x2])

%on calcule la hessienne et on regarde si elle est definie positive
h=hessian(z,[x1,x2])

%on remplace x1 par 1 et x2 par 1
x1=0;
x2=0;
%on montre g en substituant
g2=subs(g)

%on montre h en substituant
h2=subs(h)

syms x1 x2
%on dessine la surface dans la zone voulu
ezsurf(x1,x2,z,[-2,2])


%on dessine les contours si on veut
%ezcontourf(z,[-2,2,-1,3])

 

