%Funci�n que recibe una poblaci�n desordenada, esta funci�n la ordena y
%regresa la mitad con mejor aptitud. 
function [F,P,Prob]=compGen(P,G)
Plen=size(P.chromosome(:),1);
Plen2=Plen/2;
[F,P,Prob]=rmsemodelsGen(P,G);
P.chromosome=P.chromosome(1:Plen2);
F=F(1:Plen2);
Prob=Prob(1:Plen2);
end