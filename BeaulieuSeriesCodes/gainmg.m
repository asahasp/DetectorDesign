

 function val = gainmg(x,alpha,beta)
    
   num = 2*(pdf_mg(x,alpha,beta)^2);
   den = (1 - cdf_mg(x,alpha,beta))/2;
   val = num/den;
