%Funci�n que recibe dos n�meros pNo y cNo que corresponden al n�mero de
%cromosomas y n�mero de genes en el cromosoma sucesivamente.
%Devuelve la poblaci�n de cromosomas que consiste en permutaciones de 1 a cNo.
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