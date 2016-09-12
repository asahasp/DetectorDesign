

   function val = sym3_threshold(x,threshold)

     % computes the inverse of the mixed Gaussian CDF (not PDF)
     % for a number between 0 and 1

     if(x < -threshold)
       val = -1;
     end
     if((-threshold < x)&(x < -threshold))
       val = 0;
     end
     if(x >= threshold)
       val = 1;
     end
     
