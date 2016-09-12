
 % plots the CDF of the sum of 10 RVs with mix of gau PDFs
 % using beaulieu series

 alpha_ideal = 0.3;
 beta_ideal = 5;
 max_k = 301;
 G_ideal = zeros(1,max_k);

 x = zeros(1,201);
 G_real = zeros(1,201);
 G = zeros(1,201);

 y = zeros(1,max_k);
 ly = -15;uy = 15;

 la = 0.2;ua = 0.7; max_a = 20;
 lb = 3; ub = 8; max_b = 20;

 array_alpha = zeros(1,5);
 array_beta = zeros(1,5);
   
 for i = 1:max_k
   y(i) = ly + ((i-1)/(max_k-1)*(uy-ly)); 
   G_ideal(i) = beaulieu_mg(y(i),alpha_ideal,beta_ideal);
 end

 sigma = 10;
 mask_size = 101;
 total = 0;
 for i = 1:mask_size
   y(i) = ((i-51)/(101-1)*10); 
   mask(i) =(1/(sqrt(2*pi)*sigma))*exp(-((y(i)/sigma)^2)/2);
   total=total+mask(i); 
 end
% total
 mask = mask/total;
% total
% for i = 1:mask_size
%   total=total+mask(i); 
% end

 long_G_real = conv(G_ideal,mask);
 G_real(1:201) = long_G_real(101:301);
 new_lx = -10;new_ux = 10;
 new_max_k = 201;

 for i_a = 1:max_a
%   i_a
   alpha = la + ((i_a-1)/max_a*(ua-la));
   array_alpha(i_a) = alpha;
   for i_b = 1:max_b
     beta = lb + ((i_b-1)/max_b*(ub-lb));
     array_beta(i_b) = beta;
     for i = 1:new_max_k
       x(i) = new_lx + ((i-1)/(new_max_k-1)*(new_ux-new_lx)); 
       G(i) = beaulieu_mg(x(i),alpha,beta);
     end
%     size(x)
%     size(G)
%     size(G_real)
%     pause;
%     figure;
%     plot(x,G,'r-');
%     hold on;
%     plot(x,G_real,'g-');
%     pause;
 
     ms_error(i_a,i_b)= norm(G-G_real); 
   end

 end  

 figure;
 surf(array_alpha,array_beta,ms_error);
 [cols_min,rows_indices] = min(ms_error);
 [lms_min,cols_i] = min(cols_min); 
% ms_error
% lms_min
 rows_i=rows_indices(cols_i);
% cols_i

 alpha_lms=array_alpha(rows_i) 
 beta_lms=array_beta(cols_i) 
