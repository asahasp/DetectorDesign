

 function plot_NC
  
   N = 11;
   M = 11;
   la = zeros(1,N);
   C = zeros(1,M);
   NC = zeros(N,M);
   for i=1:N
     for j=1:M    
       la(i) = 0.1+((i-1)*0.8/(N-1));
       C(j) = 2+((j-1)*8/(M-1));
       [x,y] = new_rootmg(la(i),C(j));
       NC(i,j) = y;       
     end
   end
   figure;
   surf(la,C,NC);