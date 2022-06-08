clear all;
close all;
clc;
%%
%Inicializar gráficar
tic

yAct=transpose(csvread('pruebaActinv10000.csv'));
y1=transpose(csvread('pruebaMER1inv10000.csv'));
y2=transpose(csvread('pruebaMER2inv10000.csv'));
y3=transpose(csvread('pruebaMER3inv10000.csv'));
y4=transpose(csvread('pruebaMER4inv10000.csv'));
y5=transpose(csvread('pruebaMER5inv10000.csv'));
y6=transpose(csvread('pruebaMER6inv10000.csv'));
y7=transpose(csvread('pruebaMER7inv10000.csv'));
y8=transpose(csvread('pruebaMER8inv10000.csv'));
dayLen=floor(size(y1,2)/24);
x = 1:1:dayLen;
yAct=h2d(yAct);
y1=h2d(y1);
y2=h2d(y2);
y3=h2d(y3);
y4=h2d(y4);
y5=h2d(y5);
y6=h2d(y6);
y7=h2d(y7);
y8=h2d(y8);
y=[y1;y2;y3;y4;y5;y6;y7;y8];
dy1=h2d(y1);
E=20;
%for i=1:E
c=0;
while c==0
Pno1=randi(150);
Pno2=randi(150);
Pno3=randi(150);
if and(and(rem(Pno1,2) == 0,rem(Pno2,2) == 0),rem(Pno3,2) == 0)
    c=1;
end
end
G = graph_init_(x,y,yAct);
P1=pop_init_PM10(y,Pno1);
P2=pop_init_PM10(y,Pno2);
P3=pop_init_PM10(y,Pno3);
%%
%Captura de parámetros iniciales 
M=1000;
delta=0.00000002;
D=0;
deltaVar=0;
deltaIt=10;
SelecP1='Mono';
SelecP2='Roulette';
SelecP3='Hall of Fame';
porcP1=2;
porcP2=5;
porcP3=10;
tic
%%
%Generación de población y evalución de población generada
[best1,mean1]=popEvalPM10(P1,G);
[best2,mean2]=popEvalPM10(P2,G);
[best3,mean3]=popEvalPM10(P3,G);
[F1,P1,Prob1]=rmsemodelsGen(P1,G);
[F2,P2,Prob2]=rmsemodelsGen(P2,G);
[F3,P3,Prob3]=rmsemodelsGen(P3,G);
cont=1;
X(cont)=cont;
Ymean(cont,1)=mean1;
Ybest(cont,1)=best1;
Ymean(cont,2)=mean2;
Ybest(cont,2)=best2;
Ymean(cont,3)=mean3;
Ybest(cont,3)=best3;
bestFit=inf;
worstFit=0;
P=[P1;P2;P3];
P1=rmfield(P1,'len');
P2=rmfield(P2,'len');
P3=rmfield(P3,'len');
% Ydist(cont)=distance;
%%
%Generación y evalución de generaciones: criterio de término es iteraciones
%máximas = M y promedio de aptitud > epsilon 
while cont<M & D<deltaIt
    %Selección de parejas a cruzar
    P1=selecPM10(SelecP1,P1,G);
    P2=selecPM10(SelecP2,P2,G);
    P3=selecPM10(SelecP3,P3,G);
    %Cruza de población 
    P1=crossover(P1);
    P2=crossover(P2);
    P3=crossover(P3);
    %Mutación de población
    P1=mutation(P1,porcP1,y,'Uniform',10);
    P2=mutation(P2,porcP2,y,'Bit String',10);
    P3=mutation(P3,porcP3,y,'Uniform',10);
    %Criterio elitista: Competencia genética
    [F1,P1,Prob1]=compGen(P1,G);
    [F2,P2,Prob2]=compGen(P2,G);
    [F3,P3,Prob3]=compGen(P3,G);
    %Evaluación de nueva generación y captura del hijo medio y mejor
    %adaptado
    [best1,mean1,P1]=popEvalPM10(P1,G);
    [best2,mean2,P2]=popEvalPM10(P2,G);
    [best3,mean3,P3]=popEvalPM10(P3,G);
    cont=cont+1;
    X(cont)=cont;
    Ymean(cont,1)=mean1;
    Ybest(cont,1)=best1;
    Ymean(cont,2)=mean2;
    Ybest(cont,2)=best2;
    Ymean(cont,3)=mean3;
    Ybest(cont,3)=best3;
    m=mean(Ymean(cont,:));
    %display(m);
    [minVal,minIndex]=min(Ymean(cont,:));
    [maxVal,maxIndex]=max(Ymean(cont,:));
    worstIsland=P(maxIndex);
     if minVal<bestFit
         bestFit=Ymean(cont,minIndex);
         bestIsland=P(minIndex);
     end
%      itMig=randi(10);
%      for i = 1:itMig
%          caso=randi(6);
%          switch caso
%              case 1
%                  [P1,P2]=migracionPM10(P1,P2,1);
%              case 2
%                  [P2,P3]=migracionPM10(P2,P3,1);
%              case 3
%                  [P3,P1]=migracionPM10(P3,P1,1);
%              case 4
%                  [P1,P2]=visitaPM10(P1,P2,1);
%              case 5
%                  [P2,P3]=visitaPM10(P2,P3,1);
%              case 6
%                  [P3,P1]=visitaPM10(P3,P1,1);    
%          end
%      end
%      [P1,P2]=visitaPM10(P1,P2,1);
%      [P2,P3]=visitaPM10(P2,P3,1);
%      [P3,P1]=visitaPM10(P3,P1,1);
    %%
    %Cálculo del diferencial entre cada  generación
    P=[P1;P2;P3];
    Delta=abs(m-deltaVar);
    if (Delta)<delta
        D=D+1;
        %migPorc=randi(1);
        [P(minIndex),P(maxIndex)]=migracionPM10(bestIsland,worstIsland,1);
    else
        D=0;
    end
    P1=P(1);
    P2=P(2);
    P3=P(3);
    deltaVar=m;
end
X0=transpose(P1.chromosome(1).gene(:));
rmse=rmseAr(X0,yAct)
toc
%%
%Gráfica de Hijo Medio
figure(2)
subplot(1,1,1);
plot(X,Ymean(:,1),'-b');
hold on;
plot(X,Ymean(:,2),'-r');
hold on;
plot(X,Ymean(:,3),'-g');
plot(X,Ymean,'*k','linewidth',0.3);
title('Hijo Medio');
ylabel('Aptitud');
xlabel('Iteración #');
legend({'Isla 1','Isla 2','Isla 3'},'Location','southwest')
hold on;











