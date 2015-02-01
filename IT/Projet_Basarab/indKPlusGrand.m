function [L]=indKPlusGrand(M,k)

L=[];
for i=1:k
    % b=indice de la colone de l'indice le plus grand
    [a,b] = max(max(M));
    % d=indice de la ligne de l'indice le plus grand
    [c,d] = max(M(:,b));
    
    L(i,1)=d;
    L(i,2)=b;
    M(d,b)=0;
end
