function traj_ope(A,B,M,C)
%
% =====================================================
%  Tracé de la trajectoire opérationnelle
% =====================================================
%
nargs=nargin;
if (nargs ~= 3 & nargs ~= 4)
	error('Nombre incorrect d''arguments')
end
%
if nargs == 3
	plot(A(1),A(2),'g+',B(1),B(2),'r+',M(1,:),M(2,:),'y-')
else
	plot(A(1),A(2),'g+',B(1),B(2),'r+',C(1),C(2),'y+',M(1,:),M(2,:),'y-')
end
axis('equal')
grid
xlabel('x (en m)');ylabel('y (en m)');
title('Trajectoire opérationnelle')
