function ssplot(t1,t2,tf,t,s,sd,sdd)
%
% ==========================================================
%  Tracés des graphes s(t), sd(t), sdd(t)
% =============================================================
%
subplot(3,1,1)
plot(t,s)
commutplot(t1,t2,tf)
grid
ylabel('s (en m)')
title(' Graphes de s(t), sd(t) et sdd(t)')
subplot(3,1,2)
plot(t,sd)
commutplot(t1,t2,tf)
grid
ylabel('sd (en m/s)')
subplot(3,1,3)
plot(t,sdd)
commutplot(t1,t2,tf)
grid
ylabel('sdd (en m/s2)')
xlabel('t (en s)')
