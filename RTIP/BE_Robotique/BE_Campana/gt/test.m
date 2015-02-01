% Programme principal

clear all;
close all

A=[1 0];
B=[0 1];
Vmax=2;
VAB=1;
Amax=1;

[t,dt,tf,qplus,gamma]= deplacer(A,B,'droite',VAB,Vmax,Amax);
