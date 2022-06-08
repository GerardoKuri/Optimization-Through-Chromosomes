%Función que recibe como primer parámetro a población emisora y como
%segundo a población receptora del cromosoma que se desea mandar a visitar.
%Como tercer parámetro recibe la posición de este cromosoma.
%Devuelve Las dos poblaciones despues de la reproducción de su visita. 
function [P1,P2]=visitaPM10(P1,P2,pos1)
P1len=size(P1.chromosome,2);
P2len=size(P2.chromosome,2);
pos1=randi(P1len);
pos2=randi(P2len);
len=size(P1.chromosome(1).gene(:),1);
xpoint=randi([1,round(len/3)]);
xpoint2=randi([xpoint,round(2*(len/3))]);
xpoint3=randi([xpoint2,len-1]);
parte11=P1.chromosome(pos1).gene(1:xpoint);
parte12=P1.chromosome(pos1).gene(xpoint+1:xpoint2);
parte13=P1.chromosome(pos1).gene(xpoint2+1:xpoint3);
parte14=P1.chromosome(pos1).gene(xpoint3+1:end);
parte21=P2.chromosome(pos2).gene(1:xpoint);
parte22=P2.chromosome(pos2).gene(xpoint+1:xpoint2);
parte23=P2.chromosome(pos2).gene(xpoint2+1:xpoint3);
parte24=P2.chromosome(pos2).gene(xpoint3+1:end);
P2.chromosome(P2len).gene(1:xpoint)=[parte11];
P2.chromosome(P2len).gene(xpoint+1:xpoint2)=[parte22];
P2.chromosome(P2len).gene(xpoint2+1:xpoint3)=[parte13];
P2.chromosome(P2len).gene(xpoint3+1:end)=[parte24];
P2.chromosome(P2len-1).gene(1:xpoint)=[parte21];
P2.chromosome(P2len-1).gene(xpoint+1:xpoint2)=[parte12];
P2.chromosome(P2len-1).gene(xpoint2+1:xpoint3)=[parte23];
P2.chromosome(P2len-1).gene(xpoint3+1:end)=[parte14];
end