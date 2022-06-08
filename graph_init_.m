function G = graph_init_(x,y,real)    
G.len.x=length(x);
G.len.y=size(y,1);
for i = 1:G.len.x
    for j =1:G.len.y
        G.nodo(i).x=x(i);
        G.nodo(i).y(j)=y(j,i);
    end
end
%%
G.costMat = zeros(G.len.y,G.len.x);

for i = 1:G.len.x
    m=mean(y(:,i));
    for k = 1:G.len.y
            G.costMat(k,i)=abs(m-y(k,i));
    end
end
%%
%G.costMat = zeros(G.len.y,G.len.x);
% for i = 1:G.len.y
%     for j = 1: G.len.x
%         x1 = G.nodo(j).y(i);
%         x2 = real(j);
%         G.costMat(i,j)=abs(x2-x1);
%     end 
% end
% 
%%
% G.costMat = zeros(G.len.y,G.len.y,G.len.x);
% 
%    
%    for i = 1:G.len.y
%        for j = 1:G.len.y
%            for k =1:G.len.x-1
%                x1 = G.nodo(k).x;
%                x2 = G.nodo(k+1).x;
%                y1 = G.nodo(k).y(i);
%                y2 = G.nodo(k+1).y(j);
%                G.costMat(i,j,k)=sqrt((x1-x2)^2 + (y1-y2)^2);
%            end
%        end
%    end
end
