<<<<<<< HEAD
function [T] = DenHart(a,alpha,r,theta)
T=zeros(4,4);
T=[[cos(theta) , -sin(theta) , 0 , a];
[sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -r*sin(alpha)];
[sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha) , r*cos(alpha)];
=======
function [T] = DenHart(a,alpha,r,theta)
T=zeros(4,4);
T=[[cos(theta) , -sin(theta) , 0 , a];
[sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -r*sin(alpha)];
[sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha) , r*cos(alpha)];
>>>>>>> 25b88a0d14b548b32fefd94b9a51113781a0067a
[0 , 0 , 0 , 1]];