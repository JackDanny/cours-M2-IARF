function traj_gen(qplus,qmoins,nf)
%
% =====================================================
%  Trace des trajectoires généralisées
% =====================================================
%
radeg=180/pi;
qplus(1,:)=radeg*qplus(1,:);
plot(qplus(1,1),qplus(2,1),'g+',qplus(1,:),qplus(2,:),'y-',...
qplus(1,nf+1),qplus(2,nf+1),'r+')
grid
hold on
qmoins(1,:)=radeg*qmoins(1,:);
plot(qmoins(1,1),qmoins(2,1),'g+',qmoins(1,:),qmoins(2,:),'b-',...
qmoins(1,nf+1),qmoins(2,nf+1),'r+')
hold off
xlabel('q1 (en �)');ylabel('q2 (en m)');
title('Trajectoires généralisées')
