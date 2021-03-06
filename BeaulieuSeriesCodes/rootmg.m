

 function x = rootmg(la,C);

   % finding roots
   num_local_max = 5;
   arg_zero = zeros(1,num_local_max);
   max_bisect = 10;
   max_x=1;
   search = max_x/num_local_max;
   num_zero = 0;

   for indl=1:num_local_max
     lb(indl) = (indl-1)*search;
     ub(indl) = indl*search;
     x1 = lb(indl);
     x2 = ub(indl);
     x = (x1+x2)/2;
     range = [x1,x2];
   
     y1 = 1- 2*gcfmg(x1,la,C);
     y2 = 1- 2*gcfmg(x2,la,C);
     y  = 1- 2*gcfmg(x,la,C);
     edge_val = [y1,y2];
  
     % finding zero of the expression y
     % corresponding to maxima, not minima 
     for i=1:max_bisect
       if (y>0)
         x1 = x;
       else
         x2 = x;
       end
       range = [x1,x2];
       x = (x1+x2)/2;
       y = 1- 2*gcfmg(x,la,C);
     end
      
     if (abs(y) <= 1/100)
       num_zero = num_zero+1;
       arg_zero(num_zero) = x;
     end
   end %for indl loop
   
   %Finding the global maxm
   arg_local_max = zeros(1,num_zero);
   local_max = zeros(1,num_zero);

   arg_local_max(1:num_zero) = arg_zero(1:num_zero);
   %arg_local_max

   for indl=1:num_zero
     x = arg_local_max(indl);
     num = 2*(pdf_mg(x,la,C)^2);         
     den = (1-cdf_mg(x,la,C))/2;
     local_max(indl) = num/den;
   end

   %disp('the number of local maxima found');
   %num_zero
   %local_max
   %arg_local_max
      
   [sorted_y, sorted_index_y] = sort(local_max);
   global_max =  sorted_y(length(sorted_y));
   arg_global_max = arg_local_max(sorted_index_y(length(sorted_y)));
   x = arg_global_max;

