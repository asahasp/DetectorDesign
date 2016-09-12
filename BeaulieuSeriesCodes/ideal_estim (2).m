
 % plots the CDF of the sum of 10 RVs with mix of gau PDFs
 % using beaulieu series

 alpha_ideal = 0.3;
 beta_ideal = 5;
 max_k = 201;
 x = zeros(1,max_k);
 G_ideal = zeros(1,max_k);
 G = zeros(1,max_k);

 la = 0.2;ua = 0.7; max_a = 25;
 lb = 3; ub = 8; max_b = 25;

 array_alpha = zeros(1,max_a);
 array_beta = zeros(1,max_b);
 ms_error = zeros(max_a,max_b); 
   
 lx = -10;ux = 10;

 for i = 1:max_k
   x(i) = lx + ((i-1)/(max_k-1)*(ux-lx)); 
   G_ideal(i) = beaulieu_mg(x(i),alpha_ideal,beta_ideal);
 end

 for i_a = 1:max_a
   i_a
   alpha = la + ((i_a-1)/max_a*(ua-la));
   array_alpha(i_a) = alpha;
   for i_b = 1:max_b
%     i_b
     beta = lb + ((i_b-1)/max_b*(ub-lb));
     array_beta(i_b) = beta;
     for i = 1:max_k
       x(i) = lx + ((i-1)/(max_k-1)*(ux-lx)); 
       G(i) = beaulieu_mg(x(i),alpha,beta);
     end
     ms_error(i_a,i_b)= norm(G-G_ideal); 
   end

 end  

 figure;
 surf(array_alpha,array_beta,ms_error);
 xlabel('\alpha');
 ylabel('\beta');
 zlabel('MSE(\alpha,\beta)');

