function [q,qd,qdd]=mirp(M,Md,Mdd,eps2);
%
% ================================================================
%  Les modèles inverses du robot manipulateur "RP"
%                         [q,qd,qdd]=mirp(M,Md,Mdd,eps2)
%
% - q: coordonnées généralisées q(1) (en rd), q(2) (en m)
% - x: coordonnées opérationnelles (en rd ou en m) x(1),x(2)
% - eps2: si eps2='+' alors q(2)>0
%         si eps2='-' alors q(2)<0
% ================================================================
%
% ----------------------------------------------------------------
%  Les modèles géométriques inverses
%

for i=1:length(M(1,:))   
    q(1,i)= atan2(M(2,i),M(1,i));
    q(2,i)= sqrt(M(1,i)^2+M(2,i)^2);
end

% q(2)= (M(1,:).^2+M(2,:).^2).^(1/2);
if eps2 == '-'
    for i=1:length(M(1,:))  
        q(1,i)= atan2(M(2,i),M(1,i)) + pi;
        q(2,i)= -sqrt(M(1,i)^2+M(2,i)^2);
    end	
end

c1=cos(q(1,:));s1=sin(q(1,:));
%
% ----------------------------------------------------------------
%  Les modèles cinématiques inverses
%
for i=1:size(Md,2)
    qd(2,i)= cos(q(1,i))*Md(1,i)  + sin(q(1,i))*Md(2,i);
    qd(1,i)= -(sin(q(1,i))/q(2,i))*Md(1,i)  + (cos(q(1,i))/q(2,i))*Md(2,i);
end
%
% ----------------------------------------------------------------
%  Les modéles accélérométriques inverses
%
% qdd(2,:)=
% qdd(1,:)=

for i=1:size(Mdd,2)
    J = [-q(2,i)*sin(q(1,i)) cos(q(1,i));q(2,i)*cos(q(1,i)) sin(q(1,i))];
    Jinv = inv(J);
    Jd = [-(qd(2,i)*sin(q(1,i))+q(2,i)*qd(1,i)*cos(q(1,i))) -qd(1,i)*sin(q(1,i));qd(2,i)*cos(q(1,i))-qd(1,i)*q(2,i)*sin(q(1,i)) qd(1,i)*cos(q(1,i))];
    Qdd=Jinv *(Mdd(:,i) - Jd * qd(:,i));
    qdd(1,i) = Qdd(1);
    qdd(2,i) = Qdd(2);
end








