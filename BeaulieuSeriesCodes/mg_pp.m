
function val = mg_pp(x,a,b);
  
  c = sqrt(a+((1-a)*b^2));
  x1 = c*x; x2 = c*x/b;
  R = exp(-(1-(1/b^2))*x1^2/2);  
  t1 = (a*(1-x1^2)*R)+((1-a)/b^3*(1-x2^2));
%  t2 = -c^3;
  t2 = -c^3*exp(-x2^2/2)/sqrt(2*pi);
  
  val = t1*t2;
      