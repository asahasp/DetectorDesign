

 function brent(alpha,beta)

   a = alpha; b = beta;
   lx = 0; ux = 3;
   count=0;
   eps = 0.01;
   thresh = 0.01;
   M = 5;
   
   phi = min(f(lx,a,b),f(ux,a,b));
   count=count+2;
   if(phi==f(lx,a,b))
    mu = lx;
   else
    mu = ux;
   end
   x2 = lx;

   flag1=1;
   x3 = (x2+ux)/2;
    
   while(flag1==1)
     if((x2>=(ux-eps))|(abs(x3-x2)<eps))    
      flag1=0; 
      break;
     else
      x3 = (x2+ux)/2;
     end
     flag2=1;
     while(flag2==1)
       if(f(x3,a,b)<phi)
        count=count+1;  
        mu = x3;
        phi = f(x3,a,b);
       end  

       % minimum attained by parabola
       f3 = f(x3,a,b);
       f2 = f(x2,a,b);
       count=count+2;  
 
       Df = (f3-f2)/(x3-x2);
       t1 = f3 - Df*M*(x3-x2)/2;
       t2 = -(M*((x3-x2)^2))/4 - (Df^2)/4;
       par_min = t1+t2;
      
       if((par_min > (phi - thresh))|(abs(x3-x2)<eps))
        flag2=0;
       else
        x3 = (x2+x3)/2;
       end
     end %while flag2 loop
     x2 = x3;
   end
   count
   mu
   phi

