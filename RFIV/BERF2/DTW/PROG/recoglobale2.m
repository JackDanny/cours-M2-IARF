


locuteurs={'alban','brice','eric','etienne','gabrielides','hyliass','jean','nabil','thomas'};

% Paramétrisation

mots={'cinq','cinquante','deux','diviser','dix','douze','egal','et','fois','huit','moins','multiplier','neuf','onze','par','plus','quarante','quatorze','quatre','quinze','seize','sept','six','soixante','sur','treize','trente','trois','un','vingt','zero'};

locuteur= 'dominique';



matriceConfusion={};

for i=1:length(mots)
    for j=1:length(mots)
        matriceConfusion{i,j}=0;
    end
end



%ensemble des coeffs spectraux de tous les fichiers de references
refs={};

%refs contient tous les coeffs spectraux de références
for i=1: length(mots)
   
        refs{i} = extractionCoeffCepstraux(['../Sons OK/' mots{i} '_' locuteur '_2012.wav']);
    
end

%ensemble des coeffs spectraux de tous les fichiers de tests
tests={};

for i=1: length(mots)
   for j=1:length(locuteurs)
        tests{i,j} = extractionCoeffCepstraux(['../Sons OK/' mots{i} '_' locuteurs{j} '_2012.wav']);
    end
end


locuteurs{length(locuteurs)+1}='veysseire';

for i=1: length(mots)
    tests{i,length(locuteurs)} = extractionCoeffCepstraux(['../sonsveysseire/' mots{i} '_veysseire_2014.wav']);
end


close all;

disp(['traitement en cours...']);

matriceCoutTotal = [];

%pour chaque mots de chaque locuteur

matriceDist={};
for i=1 : length(mots)
    
    for j=1:length(locuteurs)
        %on calcule la DTW avec les mots de reference
        for k=1 : length(mots)
            [chemin dynamicT coutTotal,ens] = DTW_IAN(tests{i,j}, refs{k});
            matriceCoutTotal(k) = coutTotal;
            matriceDist{j}{i,k} = coutTotal;
            
            %nomFig= [ 'test: ' mots{i} '_' locuteurs{j} ' ref: ' mots{k} '_' locuteur];
            %h=figure('Name',nomFig);
            %set(h,'visible','off');
            %imagesc(chemin), xlabel('Test'), ylabel('Ref')
            %saveas(h,['../images/' nomFig],'jpg');


        end


         [dist,mot]=decision(matriceCoutTotal,mots);
         
         
        phrase=['mot ' mots{i} '_' locuteurs{j} ' reconnu comme ' mots{mot} '_' locuteur ' avec distance de ' num2str(dist) ];
    fprintf ('\n');
    
    disp(phrase)
    matriceConfusion{i,mot} = matriceConfusion{i,mot} + 1;
    
    end

end


   


matriceFinal={};

for i=1 : length(mots)
    matriceFinal{i+1,1} = mots{i};
end


for j=1 : length(mots)
    matriceFinal{1,j+1} = mots{j};
end

for i=1 : length(mots)
   
    for j =1 : length(mots)
           
           matriceFinal{i+1,j+1} = matriceConfusion{i,j};
    end
end

result = sum(diag(cell2mat(matriceConfusion)))/sum(sum(cell2mat(matriceConfusion)))

 phrase=['le taux de reconnaissance est de:' result];

%fileID = fopen(['../matrix/a.txt'],'w');
%formatSpec = '%s %f %f %f %f %f %f %f %f %f %f\n';
%for i=2:length(mots)
% fprintf(fileID,formatSpec,matriceFinal{i,:});
%end
%fclose(fileID);



%for i=1 : length(mots)
%    for j =1 : length(locuteurs)
%        h=figure('Name',[mots{i} '_' locuteurs{j}],'NumberTitle','off');
%        set(h,'visible','on');
%        bar(matriceCoutTotal(i,:))
%        title(nom{i})
%        set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31])
%        set(gca,'XTickLabel',mots})
%     saveas(h,['../results/' nom{i}],'jpg');

%end






