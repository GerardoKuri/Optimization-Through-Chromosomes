%Recibe un arreglo de horas y devuelve los valores promediados en días
function days=h2d(y)
dayLen=floor(size(y,2)/24);
days=zeros(1,dayLen);
cont=1;
for i = 1:24:(24*dayLen)
    days(1,cont)=mean(y(i:i+23));
    cont=cont+1;
end
end
