
  function val = gcfmg(y,la,C);


  im = 50;
  a = sqrt(la + ((1-la)*(C^2)) );
  R = exp(-((a*y)^2)*(1-(1/C^2))/2);

  num1 = (R*la*gcf1((a*y)^2/2,1/2,im));
  num1 = num1  + (C*(1-la)*gcf1((a*y/C)^2/2,1/2,im));
  num2 = (R*la) + ((1-la)/(C^3));
  den =  (R*la) + ((1-la)/C);

  val1 = num1/den;
  val2 = num2/den;
  
  val = val1*val2;

