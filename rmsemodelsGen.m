function [fit,P,Prob]=rmsemodelsGen(P, graph)
Plen=size(P.chromosome(:),1);
for i = 1:Plen
    P.chromosome(i).fitness=0;
    for j = 1:length(P.chromosome(1).gene(:))-1
        nodoAct=P.chromosome(i).gene(j);
        %nextNodo=tour(i+1);
        P.chromosome(i).fitness = P.chromosome(i).fitness+graph.costMat(nodoAct,j);
    end
end
[k,I]=sort([P.chromosome(:).fitness]);
P.chromosome(:)=P.chromosome(I);
fit=[];
for i=1:Plen
   %fit(i)=(P.chromosome(i).fitness-Min)/delta;
   fit(i)=P.chromosome(i).fitness;
end
for i=1:Plen
   Prob(i)=(fit(i))./sum(fit);
   %Prob(i)=fit(i)./sum(fit);
end
end