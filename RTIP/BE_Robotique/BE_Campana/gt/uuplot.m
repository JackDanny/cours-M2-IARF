function uuplot(t1,t2,tf,t,u,ud,udd)
%
% ======================================================
%  Trac�s des graphes u(t), ud(t), udd(t)
% ======================================================
%
subplot(3,1,1)
plot(t,u)
commutplot(t1,t2,tf)
grid
ylabel('u')
title(' Graphes de u(t), ud(t) et udd(t)')
subplot(3,1,2)
plot(t,ud)
commutplot(t1,t2,tf)
grid
ylabel('ud')
subplot(3,1,3)
plot(t,udd)
commutplot(t1,t2,tf)
grid
ylabel('udd')
xlabel('t (en s)')
