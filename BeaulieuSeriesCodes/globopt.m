

 function [x,NC] = globopt(alpha,beta);

 load ar;
 load br;
 load count;
 load root_fpp; 
  
  NA = length(ar);
  NB = length(br);
  
  for i=1:(NA-1)
    if ((ar(i)<=alpha)&(alpha<ar(i+1)))
      ia = i;
    end
  end
%  ia 
  for i=1:(NB-1)
    if ((br(i)<=beta)&(beta<br(i+1)))
      ib = i;
    end
  end
%  ib 
 
   num_roots = count(ia,ib); 
   num_bounds = num_roots + 2;
   bounds = zeros(1,num_bounds);
   bounds(1) = 0;
   bounds(2:num_roots+1)=root_fpp(1:num_roots);
   bounds(num_roots+2) = 3;
   
   num_local_max = num_roots+1;
   arg_zero = zeros(1,num_local_max);
   
   max_bisect = 10;
   max_x=1;
   num_zero = 0;
   NC = 0;
   for indl=1:num_local_max
     lb(indl) = bounds(indl);
     ub(indl) = bounds(indl+1);
     x1 = lb(indl);
     x2 = ub(indl);
     x = (x1+x2)/2;
     range = [x1,x2];
   
     y1 = 1- 2*gcfmg(x1,alpha,beta);
     y2 = 1- 2*gcfmg(x2,alpha,beta);
     y  = 1- 2*gcfmg(x,alpha,beta);
     edge_val = [y1,y2];
     NC = NC+3;
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
       y = 1- 2*gcfmg(x,alpha,beta);
       NC = NC+1;
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

   for indl=1:num_zero
     x = arg_local_max(indl);
     num = 2*(pdf_mg(x,alpha,beta)^2);         
     den = (1-cdf_mg(x,alpha,beta))/2;
     local_max(indl) = num/den;
   end

   [sorted_y, sorted_index_y] = sort(local_max);
   global_max =  sorted_y(length(sorted_y));
   arg_global_max = arg_local_max(sorted_index_y(length(sorted_y)));
   x = arg_global_max;
  
