
  function val = gcf1(x,a,itmax);


  ratio = zeros(1,itmax+1);
  num = zeros(1,itmax);
  den = zeros(1,itmax);

  ratio(itmax+1) = 0;

  for i= itmax:-1:1
    num(i) = i*(i-a);
    b=2*i;
    den(i) = (x+1-a) +b - ratio(i+1);
    ratio(i) = num(i)/den(i);
  end

  final_den = (x+1-a) - ratio(1);

  %figure;plot(den);
  %figure;plot(num);

  val = x/final_den;

