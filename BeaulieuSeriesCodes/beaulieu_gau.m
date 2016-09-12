

  function val = beaulieu(x)

     % beaulieu series for unit variance gaussians
     L = 10; T = 98.4;
     w = 2*pi/T;
     epsilon = x/L;
 
     sum_tn = 0;
     for m=0:50
       n=2*m+1;
       tn= (exp(-((n*w)^2)*L/2)/n)*sin(n*w*epsilon*L);
       sum_tn = sum_tn +tn;
     end
     term2 = 2/pi*sum_tn;    
     
     term1 = 1/2;
     
     val = term1+term2;
 
     % norm beaulieu's paper gives them term for the complement of the cdf.
     % whereas we are calculating the cdf.
             
