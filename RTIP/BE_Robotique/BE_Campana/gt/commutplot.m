function commutplot(t1,t2,tf)
%
% =============================================================
%  Tracé des instants de commutation t1 et t2 sur un graphe
%
% =============================================================
%
hold on
yl=get(gca,'YLim');
plot([t1 t1],yl,'r:')
plot([t2 t2],yl,'r:')
plot([tf tf],yl,'r-')
hold off
