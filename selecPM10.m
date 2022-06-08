%Funci�n que recibe una poblaci�n no ordenada por aptitud, el nombre del
%tipo de selecci�n que desea realizarse y la matriz descriptiva de distancias. 
%Se ordena la poblaci�n en caso de ser necesario.
%Devuelve la poblaci�n con las parejas ordenadas de la siguiente manera: 
%1ra y 2da, 3ra y 4ta y as� sucesivamente.
function P=selecTSP(name,P,G)
Plen=size(P.chromosome(:),1);
switch name
    case 'Rank'
        [F,P,Prob]=rmsemodelsGen(P,G);
    case 'Tournament'
        [F,P,Prob]=rmsemodelsGen(P,G);
        for i = 1:2:Plen
            T.chromosome(i)=P.chromosome(i);
            T.chromosome(i+1)=P.chromosome(Plen-i+1);
        end
        P=T;
    case 'Poli'
        for i = 1:Plen
            r=randi([1,Plen]);
            Poli.chromosome(i)=P.chromosome(r);
        end
        P=Poli;
    case 'Mono'
        for i = 1:Plen-1
            r=randi([1,Plen-i+1]);
            Mono.chromosome(i)=P.chromosome(r);
            P=remove(P,r);
        end
        Mono.chromosome(Plen)=P.chromosome(1);
        P=Mono;
    case'Hall of Fame'
        %[best,mean,P]=popEvalPM10(P,G);
        
        [k,I]=sort([P.chromosome(:).genNo],'descend');
        P.chromosome(:)=P.chromosome(I);
    case'Roulette'
        [F,P,Prob]=rmsemodelsGen(P,G);
        for i = 1:Plen
            n=rouletteWheel(Prob);
            rul.chromosome(i)=P.chromosome(n);
        end
        P=rul;
end
end