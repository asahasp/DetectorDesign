

  function val = pdf_mg(x,la,C)


     a = sqrt(la + ((1-la)*(C^2)));

     val = (la*a*gau1(a*x)) + ((1-la)*(a/C)*gau1(a*x/C));


