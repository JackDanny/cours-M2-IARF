function qqplot(t1,t2,tf,t,q,qd,qdd)
%
% =====================================================
%  Tracé de variation des coordonnées généralisées
%  et des dérivéees successives
% =====================================================
%
title('Graphes de q(t), qd(t), qdd(t)')
radeg=180/pi;
subplot(3,2,1)
plot(t,radeg*q(1,:))
commutplot(t1,t2,tf)
ylabel('q1 (en °)');
grid
subplot(3,2,3)
plot(t,qd(1,:))
commutplot(t1,t2,tf)
ylabel('q1d (en rd/s)');
grid
subplot(3,2,5)
plot(t,qdd(1,:))
commutplot(t1,t2,tf)
xlabel('t (en s)');ylabel('q1dd (en rd/s2)');
grid
subplot(3,2,2)
plot(t,q(2,:))
commutplot(t1,t2,tf)
ylabel('q2 (en m)');
grid
subplot(3,2,4)
plot(t,qd(2,:))
commutplot(t1,t2,tf)
ylabel('q2d (en m/s)');
grid
subplot(3,2,6)
plot(t,qdd(2,:))
commutplot(t1,t2,tf)
xlabel('t (en s)');ylabel('q2dd (en m/s2)');
grid
hold off