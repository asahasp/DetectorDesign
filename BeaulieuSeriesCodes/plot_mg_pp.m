
function plot_mg_pp

figure;
%array_a = [0.4,0.7,0.9];
for j = 1:3
a = 0.3+(0.3*(j-1));b=5;
%a = 0.3; b=4;
N = 501;
for i=1:N;
  x(i)=3*(i-1)/(N-1);
  y(i)=mg_pp(x(i),a,b)/pdf_mg(x(i),a,b);
%  y(i)=mg_pp(x(i),a,b);
end
plot(x,y);
hold on;
end 
