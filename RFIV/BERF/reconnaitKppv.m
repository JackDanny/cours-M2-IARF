
function [classe] = reconnaitKppv(y,vectClasse,k)
	%longueur des vecteurs d'apprentissages
	L=length(vectClasse);
	
	
	
	%liste des [vecteurs,classeduvecteur,distance par rapport à y]
	listeVectClassDist={};
	

	for i=1:L
	
		vectClasse{i,:};
	
		distance=sqrt(sum((y - (vectClasse{i,1})).^2));
		
		listeVectClassDist{i,1}=vectClasse{i,2};
		listeVectClassDist{i,2}=distance;
		
		
	end
	
	listeVectClassDist=cell2mat(listeVectClassDist);
	listeVectClassDist2=sortrows(listeVectClassDist,2);
	
	
	
	listeVectClassDistk=listeVectClassDist2(1:k);
	
	 [M,F,C]=mode(listeVectClassDistk);
	
	
	while(length(C{1})>1)
		
		k=k+1;
		listeVectClassDistk=listeVectClassDist2(1:k);
		[M,F,C]=mode(listeVectClassDistk);
		
		
		
	end
	
	classe = M;
	%on garde les k plus proches
	
	
