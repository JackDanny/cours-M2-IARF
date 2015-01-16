function x= appartient(e,L)

[l,c]=size(L);

if(l==1)
    
    if(e == L)
        x=true;
        return
    end
    x=false;
    return
end



for(i=1:length(L))
    if(e == L(i,:))
        x=true;
        return
    end
end
x=false;
return