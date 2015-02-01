function [t,dt,tf,qplus,gamma]=deplacer(A,B,TRAJEC,VAB,Vmax,Amax)
%
% ============================================================================
%
%  DEPLACER est une fonction de génération de mouvement operationnel.
%	La vitesse au démarrage et à l'arrêt est nulle. La trajectoire
%	est parcourue en temps minimal a la vitesse VAB en respectant les
%	contraintes de vitesse et d'accélération Vmax et Amax. 
%
%	[T,DT,TF,QPLUS,GAMMA]=DEPLACER(A,B,'droite',VAB,Vmax,Amax); engendre un
%	déplacement rectiligne de A à B.
%
%	[T,DT,TF,QPLUS,GAMMA]=DEPLACER(A,B,'cercle',VAB,Vmax,Amax);
%	engendre un déplacement circulaire de A à B de 180 deg dans le sens
%   trigonométrique. 
%
%  Les variables à déclarer dans l'espace de travail de Matlab sont:
%
%  Point de départ A :          A=[XA YA]
%				     XA: abcisse de A (en m)
%				     YA: ordonnée de A (en m)
%
%  Point d'arrivée B :		B=[XB YB]
%				     XB: abcisse de B (en m)
%				     YB: ordonnée de B (en m)
%
%  Nature de la trajectoire :	TRAJEC = 'droite' ou 'cercle'
%
%  Vitesse de parcours : 	VAB (en m/s)
%
%  Contraintes de vitesse :	Vmax (en m/s)
%              d'accélération : Amax (en m/s2)
% ================================================================
%

% ----------------------------------------------------------------
% Test des arguments d'entrée
%
gamma=0;
nargs=nargin;
if (nargs ~= 6) error('Nombre incorrect d''arguments')
end
%
if nargs == 6 
    if VAB > Vmax error('Vitesse de parcours VAB trop grande') 
    elseif ~strcmp(TRAJEC,'droite')
           if ~strcmp(TRAJEC,'cercle') 
                error('TRAJEC non égale à droite ou cercle')
           end
    end
end
%---------------------------------------------------------------
% Longueur trajectoire
%
if TRAJEC == 'droite'
sAB=sqrt((A(1)-B(1))^2+(A(2)-B(2))^2);
end
if TRAJEC == 'cercle'
sAB=(sqrt((A(1)-B(1))^2+(A(2)-B(2))^2) / 2)*pi;
end

% ----------------------------------------------------------------
%  Calcul de la loi de mouvement operationnel u(t)
%  et des lois de variation de l'abcisse curviligne s(t)
%               d2 u(t)           d u(t)
%      udd(t) = ------- ; ud(t) = ------ ; 0 <= u(t) <=1 ;
%                d t2              d t
%                          s(t)=u(t)*sAB
%

t1 = VAB/Amax;
t2 = sAB/VAB;
tf = t2 + t1;
Te = 0.01;
dt=Te;
t = [0 : Te : tf];

if(sAB >= VAB^2/Amax)
    for i = 1 : length(t)
        if (t(i)>=0 && t(i)<=t1)
            s(i) = 0.5 * Amax * t(i)^2;
            sd(i) = Amax * t(i);
            sdd(i) = Amax;
        end
        if (t(i)>t1 && t(i)<=t2)
            s(i) = VAB * (t(i)-t1)+0.5 * Amax * t1^2;
            sd(i) = VAB;
            sdd(i) = 0;
        end
        if (t(i)>t2 && t(i)<=tf)
            s(i) = -0.5 * Amax * (t(i)^2+tf^2)+Amax*tf*t(i)+sAB;
            sd(i) = -Amax * t(i) + Amax * tf;
            sdd(i) = -Amax;
        end
        if(t(i) > tf)
            s(i) = -0.5 * Amax * (t(i)^2+tf^2)+Amax*tf*tf+sAB;
            sd(i) = 0;
            sdd(i) = 0;
        end
        u(i)= s(i)/sAB;
        ud(i)= sd(i)/sAB;
        udd(i) = sdd(i)/sAB;
    end
else
    for i = 1 : length(t)
        if (t(i)>=0 && t(i)<=tf/2)
            s(i) = 0.5 * 4 * sAB / tf^2 * t(i)^2;
            sd(i) = 4 * sAB / tf^2 * t(i);
            sdd(i) = 4 * sAB / tf^2;
        end
        if (t(i)>tf/2 && t(i)<=tf)
            s(i) = - 0.5 * 4 * sAB / tf^2 * (t(i)^2+tf^2) + 4 * sAB / tf^2 * tf * t(i) + sAB;
            sd(i) = -4 * sAB / tf^2 * t(i) + 4 * sAB / tf;
            sdd(i) = -4 * sAB / tf^2;
        end
        if(t(i) > tf)
            s(i) = - 0.5 * 4 * sAB / tf^2 * (tf^2+tf^2) + 4 * sAB / tf^2 * tf * tf + sAB;
            sd(i) = 0;
            sdd(i) = 0;
        end
        u(i)= s(i)/sAB;
        ud(i)= sd(i)/sAB;
        udd(i) = sdd(i)/sAB;
    end
end
% ----------------------------------------------------------------
%  Affichage de la loi de mouvement opérationnel u(t)
%  et des lois de variation de l'abcisse curviligne s(t)
%
% figure n1
figure(1)
uuplot(t1,t2,tf,t,u,ud,udd)
% figure n2
figure(2)
ssplot(t1,t2,tf,t,s,sd,sdd)

% ----------------------------------------------------------------
%  Calcul de la trajectoire opérationnelle M(u)
%   M(1,:)= x(u)
% 	M(2,:)= y(u) 
up = [0 : 0.01 : 1];

if TRAJEC == 'droite'


    for i = 1 : length(up)
        x(i) = A(1) + up(i) * (B(1)-A(1));
        y(i) = A(2) + up(i) * (B(2)-A(2));
    end
	Mi(1,:)=x;
	Mi(2,:)=y;
end
if TRAJEC == 'cercle'

    C = [(B(1)+A(1))/2 (B(2)+A(2))/2];
    %dist = sqrt((A(1)-C(1))^2+(A(2)-C(2))^2);
    %=sAB

    for i = 1 : length(up)
        CM1(1,i)=cos(up(i) * pi)*( (A(1)-B(1)) /2 );
        CM1(2,i)=cos(up(i) * pi)*( (A(2)-B(2)) /2 );
    end
    for i = 1 : length(up)
        CM2(1,i)=sin(up(i) * pi)*( (B(2)-A(2))/2 );
        CM2(2,i)=sin(up(i) * pi)*( (A(1)-B(1))/2 );
    end


    for i = 1 : length(up)
        x(i) = C(1) + CM1(1,i) +  CM2(1,i);
        y(i) = C(2) + CM1(2,i) +  CM2(2,i);

    end
    Mi(1,:)=x;
	Mi(2,:)=y;
end
% ----------------------------------------------------------------
%  Affichage de la trajectoire opérationnelle M(u)
%
% figure n3
figure(3)
if TRAJEC == 'droite'
	traj_ope(A,B,Mi)
end
if TRAJEC == 'cercle'
	traj_ope(A,B,Mi,C)
end


% ----------------------------------------------------------------
%  Calcul de X(t), Y(t), et des dérivées en vitesse et accélération
if TRAJEC == 'droite'
    for i = 1 : length(u)
    X(i) = A(1) + u(i) * (B(1)-A(1));
    Y(i) = A(2) + u(i) * (B(2)-A(2));
    end
end

if TRAJEC == 'cercle'

    CA(1) = (A(1)-B(1)) /2 ;    
    CA(2) = (A(2)-B(2)) /2 ;

    CD(1) = (B(2)-A(2))/2 ;
    CD(2) = (A(1)-B(1))/2 ;
    

    for i = 1 : length(u)
        CM1(1,i)=cos(u(i) * pi)*(  CA(1) );
        CM1(2,i)=cos(u(i) * pi)*(  CA(2) );
    end
    for i = 1 : length(u)
        CM2(1,i)=sin(u(i) * pi)*( CD(1) );
        CM2(2,i)=sin(u(i) * pi)*( CD(2) );
    end


    for i = 1 : length(u)

    X(i) = C(1) + CM1(1,i) +  CM2(1,i);
    Y(i) = C(2) + CM1(2,i) +  CM2(2,i);

    end

    %dist = sqrt((A(1)-C(1))^2+(A(2)-C(2))^2);
    %=sAB

end


if TRAJEC == 'droite'
	M(1,:)=X;
	M(2,:)=Y;
	Md(1,:)= ud*(B(1)-A(1));
	Md(2,:)= ud*(B(2)-A(2));
	Mdd(1,:) = udd*(B(1)-A(1));
	Mdd(2,:) = udd*(B(2)-A(2));

end

if TRAJEC == 'cercle'
	M(1,:)=X;
	M(2,:)=Y;
    
    for i=1:length(u)
	Md(1,i)= - (CA(1)*pi*ud(i)*sin(u(i)*pi)) + (CD(1)*pi*ud(i)*cos(u(i)*pi));
	Md(2,i)= - (CA(2)*pi*ud(i)*sin(u(i)*pi)) + (CD(2)*pi*ud(i)*cos(u(i)*pi));
    end

    for i=1:length(u)
	Mdd(1,i)= - (CA(1)*pi) * ( (udd(i)*sin(u(i)*pi)) + ((ud(i)^2)*pi*cos(pi*u(i))) )  +  (CD(1)*pi) * (udd(i)*cos(u(i)*pi) - pi*(ud(i)^2) * sin(pi*u(i)) );
	Mdd(2,i)= - (CA(2)*pi) * ( (udd(i)*sin(u(i)*pi)) + ((ud(i)^2)*pi*cos(pi*u(i))) )  +  (CD(2)*pi) * (udd(i)*cos(u(i)*pi) - pi*(ud(i)^2) * sin(pi*u(i)) );
    end
	
end



%
% ----------------------------------------------------------------
%  Affichage de X(t), Y(t), et des dérivées en vitesse et accélération
%
% figure n4
figure(4)
xxplot(t1,t2,tf,t,M,Md,Mdd)

%% ----------------------------------------------------------------
%  Calcul des trajectoires généralisées q(u)
[qplus,qdplus,qddplus]=mirp(M,Md,Mdd,'+');
[qmoins,qdmoins,qddmoins]=mirp(M,Md,Mdd,'-');
%
% ----------------------------------------------------------------
%  Affichage des trajectoires généralisées
%
% figure n5

figure(5)
nf = length(t)-1;
traj_gen(qplus,qmoins,nf)
% figure n6
figure(6)
qqplot(t1,t2,tf,t,qplus,qdplus,qddplus)
figure(7)
qqplot(t1,t2,tf,t,qmoins,qdmoins,qddmoins)
%
% % ----------------------------------------------------------------
% %  Affichage de la vitesse de l'organe terminal
% %
for i =1:size(M,2)
    V(i)= sqrt(Md(1,i)^2+Md(2,i)^2);
    %V(i) = sd(i);
end
figure(8)
title('Graphe de vitesse')
plot(t,V)
commutplot(t1,t2,tf)
