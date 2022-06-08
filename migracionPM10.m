%Funci�n que recibe como primer par�metro a poblaci�n emisora y como
%segundo a poblaci�n receptora del cromosoma que se desea mandar a migrar.
%Como tercer par�metro recibe la posici�n de este cromosoma.
%Devuelve Las dos poblaciones despues de la reproducci�n de su visita.
%Esta migraci�n es permanente y "roba" un cromosoma aleatorio de la 
%poblaci�n receptora a la emisora.
function [P1,P2]=migracionPM10(P1,P2,pos1)
P1len=size(P1.chromosome,2);
P2len=size(P2.chromosome,2);
pos1=randi(P1len);
pos2=randi(P2len);
C1=P1.chromosome(pos1);
C2=P2.chromosome(pos2);
P1.chromosome(pos1)=C2;
P2.chromosome(pos2)=C1;
end
