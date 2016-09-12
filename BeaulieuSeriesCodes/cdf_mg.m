

   function val = cdf_mg(x,la,C)


     a = sqrt(la + ((1-la)*(C^2)) );
     %disp('arguments to gamminc');
     %arg1 = (a*x)^2/2
     %arg2 = (a*x/C)^2/2
     if(x >= 0)
      t1= (1+gammainc((a*x)^2/2,1/2))/2;
      t2= (1+gammainc((a*x/C)^2/2,1/2))/2;
     else
      t1= (1-gammainc((a*x)^2/2,1/2))/2;
      t2= (1-gammainc((a*x/C)^2/2,1/2))/2;
     end 
     val = (la*t1)+((1-la)*t2);

