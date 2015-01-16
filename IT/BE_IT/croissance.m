function [newImg] = croissance(image,x1,y1,Seuil)

%on lit l'image

I=image;

%I=double(image);

[W,L,c]=size(I);

%on creer la nouvelle image
newImg = zeros(W,L);

%pixel de l'amorce
R=[[x1,y1]];
newImg(x1,y1)=1;
%Valeur moyenne de la region


valReg = I(x1,y1);

%pile S contenant les pixels du contour de la region
S=[];

%liste des valeurs des elements de la pile S
valS = [];

distS=[];
%pour chaque point [x1,y1] de R, on rajoute les contours dans S

%for machin = -1:2:1 for trucmuch = -1:2:1

while 1
    
    if 0
    h=figure;
    if(h>3)
        close 'all'
    end
    imagesc(newImg);figure(gcf);
    end
    
    %'debut passage boucle'
    %S
    %R
    
    
    for i=1:4
        switch i
            case 1
                xAux =1;
                yAux =0;
            case 2
                xAux=-1;
                yAux=0;
            case 3
                xAux=0;
                yAux=1;
            case 4
                xAux=0;
                yAux=-1;
        end
        
        newX = x1+xAux;
        newY = y1+yAux;
        
        if( (newX <W) && (newX >0) && (newY <L) && (newY>0) && (appartient([newX,newY],S) == 0)&& (appartient([newX,newY],R) == 0))
            
            
            
            
            S=[S;[newX,newY]];
            
            valS=[valS;I(newX,newY)];
            
            
        end
    end
    
    %'rajout des elements dans S'
    
    
    %on calcul les distances de S a la region
    
    distS = abs(valS-valReg);
    
    %S
    %valS
    %valReg
    %distS
    
    
    
    %on prend le pixel du contour le plus proche de la region (en lvl de
    %gray)
    [mind,ind] = min(distS);
    
    
    %il faut que le pixel ne soit pas trop eloigne de la region
    if(distS(ind) < Seuil)
        %on garde l'ancienne taille de R pour recalculer facilement la
        %moyenne
        laux=length(R);
        
        R=[R;S(ind,:)];
        
        newImg(S(ind,1),S(ind,2))=1;
        
        x1=S(ind,1);
        y1=S(ind,2);
        
        
        
        
        
        
        
        %on recalcule la moyenne
        valReg = (valReg * laux + valS(ind)) / (laux+1);
        
        %on recalcule les distances de S � la region
        distS = abs(valS-valReg);
        
        %'S distS Vals'
        %S
        %distS
        %valS
        %ind
        
        %on enl�ve S(ind) de S et distS(ind) de distS et valS(ind) de valS
        S=[S(1:ind-1,:);S(ind+1:end,:)];
        distS=[distS(1:ind-1,:);distS(ind+1:end,:)];
        valS=[valS(1:ind-1);valS(ind+1:end)];
        
        
        
        %'fin de boucle'
        %S
        %R
        
        %'x1 y1'
        %x1
        %y1
        
    else
        
        imagesc(image);figure(gcf);
        figure
        imagesc(newImg);figure(gcf);
        
        return;
        
        
        
        
        
        
    end
    
end


