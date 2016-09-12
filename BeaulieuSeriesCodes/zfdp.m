y = symvar('y');
la = 0.3;
C = 5;
a = sqrt(la + ((1-la)*(C^2)) );
R = exp(-((a*y)^2)*(1-(1/C^2))/2);

num1 = -(a^3)*exp(-((a*y)^2)/(2*C^2));
num2 = la*(1-(a*y)^2)*R+(1-la)/C^3;
num3 = (1-(a*y)^2/C^2);

f = num1*num2*num3;
root = fzero(f,1)
