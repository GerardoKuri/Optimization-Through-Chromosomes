%Función que recibe una población ordenada y cruza las parejas en la posición 
%1ra y 2da, 3ra y 4ta y así sucesivamente.
%Estás parejas se cruzan en un punto, para cromosomas con genes pares este 
%punto es la mitad y para impares es la mitad + 1.
%Devuelve población del doble de tamaño con padres en la primera mitad e
%hijos en la segunda.
function P=crossover(P)
len=size(P.chromosome(1).gene(:),1);
% if rem(len,2)~=0
%     len=len+1;
% end
Plen=size(P.chromosome(:),1);
xpoint=randi([1,round((len/3))]);
xpoint2=randi([xpoint,round(2*(len/3))]);
xpoint3=randi([xpoint2,len-1]);
for i = 1:2:Plen
    parte11=P.chromosome(i).gene(1:xpoint);
    parte12=P.chromosome(i).gene(xpoint+1:xpoint2);
    parte13=P.chromosome(i).gene(xpoint2+1:xpoint3);
    parte14=P.chromosome(i).gene(xpoint3+1:end);
    parte21=P.chromosome(i+1).gene(1:xpoint);
    parte22=P.chromosome(i+1).gene(xpoint+1:xpoint2);
    parte23=P.chromosome(i+1).gene(xpoint2+1:xpoint3);
    parte24=P.chromosome(i+1).gene(xpoint3+1:end);
    P.chromosome(i+Plen).gene(1:xpoint)=[parte11];
    P.chromosome(i+Plen).gene(xpoint+1:xpoint2)=[parte22];
    P.chromosome(i+Plen).gene(xpoint2+1:xpoint3)=[parte13];
    P.chromosome(i+Plen).gene(xpoint3+1:len)=[parte24];
    P.chromosome(i+Plen+1).gene(1:xpoint)=[parte21];
    P.chromosome(i+Plen+1).gene(xpoint+1:xpoint2)=[parte12];
    P.chromosome(i+Plen+1).gene(xpoint2+1:xpoint3)=[parte23];
    P.chromosome(i+Plen+1).gene(xpoint3+1:len)=[parte14];
end
end
