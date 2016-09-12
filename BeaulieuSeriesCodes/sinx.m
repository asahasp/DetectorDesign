syms 'x'; 
% symvar 'x';

f = sin(x);
fprime = diff(f);

a = 1;
b = 0.75*pi;
delta = 0.0001;

P = [a b];
ya = subs(fprime,x,a);
yb = subs(fprime,x,b);
if ya*yb > 0, break, end
max1 = 1 + round((log(b-a)-log(delta))/log(2))
for k=1:max1,
  c  = (a+b)/2;
  yc = subs(fprime,x,c);
  if  yc == 0,
    a = c;
    b = c;
  elseif  yb*yc > 0,
    b = c;
    yb = yc;
  else
    a = c;
    ya = yc;
  end
  P = [P;a b];
  if b-a < delta, break, end
end
c  = (a+b)/2
fprimec = subs(fprime,x,c)
fc = subs(f,x,c)
err = abs(b-a)/2