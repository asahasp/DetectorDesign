

   function x = invcdf_mg(r,la,C);

     % computes the inverse of the mixed Gaussian CDF (not PDF)
     % for a number between 0 and 1

     if(r < cdf_mg(-5,la,C))
       x = -5;
     end
     if(r >= cdf_mg(5,la,C))
       x = 5;
     end
     for i=1:1000
       lb = -5+((i-1)*10/1000);
       ly = cdf_mg(lb,la,C);
       ub = -5+(i*10/1000);
       uy = cdf_mg(ub,la,C);
       if((ly<=r)&(r < uy))
         x = (lb+ub)/2;
       end 
     end
     
