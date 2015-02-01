function [img2]=houghTransf(img)


%img=imread(im);
%img=rgb2gray(img);


close 'all'

figure
imshow(img*255)


%img=double(img);
nbIntervAng=1000;

[L,l]=size(img);
rMax=sqrt(L^2 + l^2);
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
                %pour chaque valeur du parametre angulaire (ici 101 valeurs possible) on calcule le
                %parametre radial correspondant
                r=round(r);
                %il faut r positif
                if(r>0)
                    TH(r,k+1)= TH(r,k+1)+1;
                end
            end
            
        end
    end
end

%on identifie les coordonnées des k points de l'espace de hough ayant le plus de vote

A=indKPlusGrand(TH,100);

%pour chacun de ces point on trace la droite correspondante dans img2

for i=1:length(A)
    
    trouvePoint=false;
    %pour chaque point d'abcisse j,
    j=1;
    while j<=L && trouvePoint==false;
        %valeur de l'angle
        ang=A(i,2)*thetaPas;
        %on calcule l'abcisse y
        y2=(A(i,1)-j*cos(ang))/sin(ang);
        
        %on a trouve un point de l'image egal a un
        if(y2<l && round(y2)>1 && img(j,round(y2))==1)
            trouvePoint=true;
        else
            j=j+1;
        end
        
    end
    
    
    if(trouvePoint==true)
        %on va chercher "a l'envers" le point le plus eloigne sur la droite
        %egal a un
        k=L;
        trouvePoint=false;
        
        while k>0 && trouvePoint==false;
            %valeur de l'angle
            ang=A(i,2)*thetaPas;
            %on calcule l'abcisse y
            y2=(A(i,1)-k*cos(ang))/sin(ang);
            
            if(y2<l && round(y2)>1 && img(k,round(y2))==1)
                trouvePoint=true;
            else
                k=k-1;
                
            end
            
        end
        
    end
    
    if(trouvePoint==true)
        %pour faire de belles droites on prend un pas pour x de 0.5
        for x=j:0.5:k
            %valeur de l'angle
            ang=A(i,2)*thetaPas;
            %on calcule l'abcisse y
            y2=(A(i,1)-x*cos(ang))/sin(ang);
            
            if(y2<l && round(y2)>1)
                img2(round(x),round(y2))=1;
                
            end
            
            
        end
    end
    
end






figure
imagesc(TH);figure(gcf);

figure
imshow(img2)

figure
imshow(double(img)*255+img2)


