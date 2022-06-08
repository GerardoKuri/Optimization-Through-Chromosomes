%Funci�n que recibe una poblaci�n de cromosomas P y una posici�n n. 
%Devuelve una poblaci�n sin el cromosoma en la posici�n n. 

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