%Función que recibe una población, el porcentaje que se desea mutar, nombre 
%del método que se desea implementar y una variable lamda que se refiere a 
%la probabilidad que tendrán los genes de ser mutados.
%Devuelve la misma población ya mutada con los requerimientos asignados.
function P=mutation(P,porc,y,name,lamda)
Plen=size(P.chromosome,2);
Clen=size(P.chromosome(1).gene,2);
Glen=size(y,1);
mutCant=round(Plen*(porc/100));
switch name
    case'Uniform'
        for i = 1:mutCant
            for j = 1:Clen
                P.chromosome(Plen-1-i).gene(j)=randi(Glen);
            end
        end
    case'Bit String'
        lamda=100/lamda;
        lamda=1/lamda;
        for i=1:mutCant
            for j=1:Clen
                r=rand();
                if r<=lamda
                    P.chromosome(Plen-1-i).gene(j)=(Glen);
                end
            end
        end
end       
end