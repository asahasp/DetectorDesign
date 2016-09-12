

 function detector

 A1=0.1;
 sigma = 10;
 alpha = 0.3;
 beta = 5;

 N = 20;
 det_input = zeros(1,N);
 det_output = zeros(1,N);
 s = zeros(1,N);
 r = zeros(1,N);
 w = zeros(1,N);

 s(1:N) = A1*cos((2*pi/N)*(1:N));
 r(1:N) = rand(1,N);
 for i=1:N
   i
   w(i) = sigma*invcdf_mg(r(i),alpha,beta);
 end

 det_input = s + w; 

 figure; plot(s);
 figure;plot(w);
 figure; plot(det_input);
% pause;
 [eta,NC] = globopt(alpha,beta);
 for i=1:N
%   i
   det_output(i) = sym3_threshold(det_input(i),eta);
 end

 figure;plot(det_output); 
