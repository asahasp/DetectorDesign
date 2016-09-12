

 function val = f(x,alpha,beta)
    
   num = 2*(pdf_mg(x,alpha,beta)^2);
   den = (1 - cdf_mg(x,alpha,beta))/2;
   val1 = num/den;
   val =  2-val1;
