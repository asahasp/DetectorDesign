

  function val = beaulieu_mg(x,alpha,beta)

     % calculates the beaulieu series for mixture of gaussians
     % with given mixing parameters alpha and beta

     L = 10; T = 98.4;
     w = 2*pi/T;
     epsilon = x/L;
     C = sqrt(alpha + ((1-alpha)*(beta^2)));
 
     sum_tn = 0;
     for m=0:50
       n=2*m+1;
       t1n= alpha*exp(-((n*w/C)^2)*L/2);
       t2n= (1-alpha)*exp(-((n*w*beta/C)^2)*L/2);
       tn= (t1n+t2n)/n*sin(n*w*epsilon*L);
       sum_tn = sum_tn +tn;
     end
     term2 = 2/pi*sum_tn;    
     
     term1 = 1/2;
     
     val = term1+term2;
 
     % norm beaulieu's paper gives them term for the complement of the cdf.
     % whereas we are calculating the cdf.
             
