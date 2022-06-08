%Función que recibe dos arreglos de enteros 
%Devuelve el rmse entre los dos arreglos
function rmse=rmseAr(X,Y)
len=size(Y,1);
for i = 1:len
    rmse(i)=sqrt(mean((X - Y(i,:)).^2));
end
end