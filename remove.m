%Función que recibe una población de cromosomas P y una posición n. 
%Devuelve una población sin el cromosoma en la posición n. 

function newPop = remove(P,n)
len=size(P.chromosome(:));
f=0;
for i = 1:len-1
    if i ~= n & f~=1
        newPop.chromosome(i)=P.chromosome(i);
    else
        f=1;
        newPop.chromosome(i)=P.chromosome(i+1);
    end
end
end