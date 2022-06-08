%Función que recibe una población no necesariamente ordenada por aptitud
%y la matriz descriptiva de las ditancias del problema.
%Devuelve la aptitud del cromosoma mejor adaptado,la aptitud promedio de
%la población y la distancia del cromosoma mejor adaptado.
function [best,mean,P]=popEvalPM10(P,G)
F=rmsemodelsGen(P,G);
len=size(F(:),1);
best=F(1);
mean=sum(F)/len;
for i =1:len
    P.chromosome(i).genNo=P.chromosome(i).genNo + 1;
    if isempty(P.chromosome(i).genNo)
        P.chromosome(i).genNo=1;
    end
end
end