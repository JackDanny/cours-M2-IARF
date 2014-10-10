
% x1 et x2 sont des variables formels
syms x1 x2

%on definit la fonction
z = (1/2)*power(x1,2) + x1*cos(x2)

%on calcule le gradient
g=gradient(z,[x1,x2])

%on calcule la hessienne et on regarde si elle est definie positive
h=hessian(z,[x1,x2])


disp('pour (-1,0):')
%on remplace x1 par 1 et x2 par 1
x1=-1;
x2=0;
%on montre g en substituant
g2=subs(g)

%on montre h en substituant
h2=subs(h)

disp('pour (1,pi):')

%on remplace x1 par 1 et x2 par pi
x1=1;
x2=pi;
%on montre g en substituant
g2=subs(g)

%on montre h en substituant
h2=subs(h)


disp('pour (0,pi/2):')

%on remplace x1 par 1 et x2 par pi
x1=0;
x2=pi/2;
%on montre g en substituant
g2=subs(g)

%on montre h en substituant
h2=subs(h)


disp('pour (-1,2pi):')

%on remplace x1 par 1 et x2 par pi
x1=-1;
x2=2*pi;
%on montre g en substituant
g2=subs(g)

%on montre h en substituant
h2=subs(h)




syms x1 x2
%on dessine la surface dans la zone voulu
ezsurf(x1,x2,z,[-2,2,-2,10])


%on dessine les contours si on veut
%ezcontourf(z,[-2,2,-1,3])

 

