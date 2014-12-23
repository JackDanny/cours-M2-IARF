% mi: moyenne 
% ci: matrice covariance
%les vecteurs sont des vecteurs colonnes
function [mi,ci] = apprend(donneesApp)

mi=mean(donneesApp);
ci=cov(donneesApp);
