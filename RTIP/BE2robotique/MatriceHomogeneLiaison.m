function [T] = MatriceHomogeneLiaison(a,alpha,r,theta)
T=zeros(4,4);
T=[[cos(theta) , -sin(theta) , 0 , a];
[sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -r*sin(alpha)];
[sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha) , r*cos(alpha)];
[0 , 0 , 0 , 1]];