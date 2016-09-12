
 % plots the CDF of the sum of 10 RVs with mix of gau PDFs
 % using beaulieu series

 alpha1 = 0.1; 
 alpha2 = 0.3;
 alpha3 = 0.5;
 beta = 5;
 max_k = 201;
 
 G1 = zeros(max_k);
 G2 = zeros(max_k);
 G3 = zeros(max_k);
 x = zeros(max_k);
 lx = -10;ux = 10;
 
 for i = 1:max_k
   x(i) = lx + ((i-1)/(max_k-1)*(ux-lx)); 
   G1(i) = beaulieu_mg(x(i),alpha1,beta);
   G2(i) = beaulieu_mg(x(i),alpha2,beta);
   G3(i) = beaulieu_mg(x(i),alpha3,beta);
 end

 figure;
 plot(x,G1,'r-');
 hold on;
 plot(x,G2,'g-'); 
 hold on;
 plot(x,G3); 

