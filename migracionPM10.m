%Función que recibe como primer parámetro a población emisora y como
%segundo a población receptora del cromosoma que se desea mandar a migrar.
%Como tercer parámetro recibe la posición de este cromosoma.
%Devuelve Las dos poblaciones despues de la reproducción de su visita.
%Esta migración es permanente y "roba" un cromosoma aleatorio de la 
%población receptora a la emisora.
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
