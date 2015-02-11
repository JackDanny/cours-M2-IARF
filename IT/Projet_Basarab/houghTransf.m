function [img2]=houghTransf(img,K)

% K sert a indiquer le nombre de droite que l'on veut tracer


close 'all'

figure
%on affiche l'image original sur la figure 1
imshow(img*255)


%img=double(img);
nbIntervAng=1000;

%on recupère la hauteur L et la largeur l de l'image
[L,l]=size(img);

%valeur max possible du parametre radial
rMax=sqrt(L^2 + l^2);

%pas de variation du parametre angulaire
thetaPas=(2*pi)/nbIntervAng;


%image dans l'espace de Hough
TH=zeros(floor(rMax)+1,nbIntervAng+1);

%image finale
img2=zeros(size(img));

%pour chaque pixel (i,j)
for i=1:L
    for j=1:l
        %si il appartient à un contour, on modélise dans TH toutes
        %les droites passant par ce point
        if img(i,j)==1
            for k=0:1:nbIntervAng
                %on utilise la représentation polaire des droites
                r=i*cos(k*thetaPas) + j*sin(k*thetaPas);
                %pour chaque valeur du parametre angulaire (ici 1001 valeurs possible) on calcule le
                %parametre radial correspondant, et on l'arrondi pour
                %avoir un entier 
                r=round(r);
                %il faut que r soit positif
                if(r>0)
                    %on rajoute un vote pour cette droite, correspondant à un
                    %point dans l'espace de vote
                    TH(r,k+1)= TH(r,k+1)+1;
                end
            end
            
        end
    end
end

%on identifie les coordonnées des K points de l'espace de hough ayant le plus de vote
A=indKPlusGrand(TH,K);


%pour chacun de ces points on trace la droite correspondante dans img2

%on cherche le premier point de la droite non nul
for i=1:length(A)
    trouvePoint=false;
    %pour chaque point d'abcisse j,
    j=1;
    while j<=L && trouvePoint==false;
        %valeur du parametre angulaire de la droite i
        ang=A(i,2)*thetaPas;
        %on calcule l'ordonnée y correspondante
        y2=(A(i,1)-j*cos(ang))/sin(ang);
        
        %on a trouve un point de l'image egal a un
        if(y2<l && round(y2)>1 && img(j,round(y2))==1)
            trouvePoint=true;
        else
            j=j+1;
        end
        
    end
    
    %si aucun point n'a ete trouve on sort de la boucle
    
    %sinon on va chercher "a l'envers" le point non nul le plus eloigne sur la droite
    
    if(trouvePoint==true)
        %on part du point d'ordonnee la hauteur de l'image et on diminue
        %pixel par pixel
        k=L;
        trouvePoint=false;
        
        while k>0 && trouvePoint==false;
             %valeur du parametre angulaire de la droite i
            ang=A(i,2)*thetaPas;
            %on calcule l'ordonnée y correspondante
            y2=(A(i,1)-k*cos(ang))/sin(ang);
            
            %si on trouve le dernier point on sort de la boucle
            if(y2<l && round(y2)>1 && img(k,round(y2))==1)
                trouvePoint=true;
            else
                k=k-1;
                
            end
            
        end
        
    end
    
    %on trace les droites reliant les deux points les plus eloignes l un de
    %l autre
    
    if(trouvePoint==true)
        %pour faire de belles droites on prend un pas de (k-j)/L 
        %ainsi la variation de x est au plus d'un pixel
        pas=(k-j)/L;
        
        
        for x=j:pas:k
            %valeur de l'angle
            ang=A(i,2)*thetaPas;
            %on calcule l'abcisse y
            y2=(A(i,1)-x*cos(ang))/sin(ang);
            
            if(y2<l && round(y2)>1)
                %on arrondi les valeurs calcules pour tomber sur des
                %entiers
                img2(round(x),round(y2))=1;
                
            end
            
            
        end
    end
    
end





%on affiche la transformee de Hough figure 2
figure
imagesc(TH);figure(gcf);

%on affiche les droites trouves
figure
imshow(img2)

%on affiche l'image avec les droites calcules
figure
imshow(double(img)*255+img2)




