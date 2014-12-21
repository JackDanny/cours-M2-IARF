function [T] = MatriceHomogeneMGD(tableurDH)

matriceTi={};

for i=1:length(tableurDH)
    
    a=tableurDH(1,i);
    alpha=tableurDH(2,i);
    r=tableurDH(3,i);
    theta=tableurDH(4,i);
    matriceTi{i}=MatriceHomogeneLiaison2(a,alpha,r,theta);
    
  
end

T=matriceTi{1};
for i=2:length(matriceTi)
   T=T*matriceTi{i};
    
    
end
