function xxplot(t1,t2,tf,t,M,Md,Mdd)
%
% =====================================================
%  Trac� de variation des coordonnées opérationnelles
%  et des dérivées successives
% =====================================================
%
title('Graphes de x(t), xd(t), xdd(t), y(t), yd(t) et ydd(t)')
subplot(3,2,1)
plot(t,M(1,:))
commutplot(t1,t2,tf)
ylabel('x (en m)');
grid
subplot(3,2,3)
plot(t,Md(1,:))
commutplot(t1,t2,tf)
ylabel('xd (en m/s)');
grid
subplot(3,2,5)
plot(t,Mdd(1,:))
commutplot(t1,t2,tf)
xlabel('t (en s)');ylabel('xdd (en m/s2)');
grid
subplot(3,2,2)
plot(t,M(2,:))
commutplot(t1,t2,tf)
ylabel('y (en m)');
grid
subplot(3,2,4)
plot(t,Md(2,:))
commutplot(t1,t2,tf)
ylabel('yd (en m/s)');
grid
subplot(3,2,6)
plot(t,Mdd(2,:))
commutplot(t1,t2,tf)
xlabel('t (en s)');ylabel('ydd (en m/s2)');
grid
hold off
