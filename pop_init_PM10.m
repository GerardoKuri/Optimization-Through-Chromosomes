%Función que recibe dos números pNo y cNo que corresponden al número de
%cromosomas y número de genes en el cromosoma sucesivamente.
%Devuelve la población de cromosomas que consiste en permutaciones de 1 a cNo.
function [poblacion]=pop_init_PM10(y,pNo)
poblacion.len=pNo;
leny1=size(y,1);
leny2=size(y,2);
for i = 1:pNo
    for j = 1:leny2
        poblacion.chromosome(i).gene(j)=randi(leny1);
        %poblacion.chromosome(i).gene(:)=p;
    end
    poblacion.chromosome(i).genNo=1;
end
end