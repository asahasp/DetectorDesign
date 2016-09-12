
 %plots the maximum gain obtained for Gaussian Gaussian mix
 % for variations in lambda and C

 max_k = 10;
 max_index_la = 11;
 lb_C = sqrt(5);
 ub_C = 10;
 C_spread = ub_C - lb_C;
 
 G_opt = zeros(max_index_la,max_k);
 indicator = zeros(max_index_la,max_k);
 norm_thresh = zeros(max_index_la,max_k);

 for index_la = 1:max_index_la
 %for index_la = 4:4
   la = (index_la-1)/(max_index_la-1); 
   %la
   index_la

   for k =1:max_k
   %for k =8:8
     k
     C = lb_C+(C_spread*k/max_k);
     %C
     array_C(k) = C;

     x = rootmg(la,C);
     zero_e(k) = x;
     norm_thresh(index_la,k) = x;
     num = 2*(pdf_mg(x,la,C)^2);
     den = (1 - cdf_mg(x,la,C))/2;
     gain_opt(k) = num/den;

     G_opt(index_la,k) = num/den;
     if (G_opt(index_la,k) >= 1)
       indicator(index_la,k) = 1;
     end
     %G_opt(index_la,k)
   end %end for k loop
 end %end index_la

 figure;surf(G_opt); 
 figure;surf(indicator);
 figure;surf(norm_thresh); 
