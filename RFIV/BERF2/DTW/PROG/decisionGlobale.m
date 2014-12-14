function [dist,mot,loc]= decision(matriceCoutTotal)

%la fonction min nous retourne une ligne avec le min de chaque colone (minimums) et 
%une ligne avec les indices de lignes ou se trouvent ces minimums pour chaque colone
[minimums,indmins]=min(matriceCoutTotal);

[minimum,indmin]=min(minimums);

loc=indmin;
mot=indmins(indmin);

%on retourne la distance

dist=minimum;


