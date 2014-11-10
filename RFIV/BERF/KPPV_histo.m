function [histo]=KPPV_histo()

histo=[];

for i=1:80

histo(i)=supermain('cepstre','KPPV',i)

end
