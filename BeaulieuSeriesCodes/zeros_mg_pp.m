
function zeros_mg_pp;

N = 81;
% this number has been chosen to give intervals
% 0.01 for alpha; 0.1 for beta
% range [0.1,0.9] for alpha, [2,8] for beta

ar = zeros(1,N);
br = zeros(1,N);
count = zeros(N,N);
root_fpp = zeros(N,N,4);
val_fpp = zeros(N,N);

for k_a = 1:N
  k_a
  for k_b = 1:N
    a = 0.1+((k_a-1)*0.01);
    b = 2+((k_b-1)*0.1); 
    ar(k_a) = a; 
    br(k_b) = b;

for i=1:1:21;
  lb=(i-1)/10;ub=i/10;
  yl=mg_pp(lb,a,b);
  yu=mg_pp(ub,a,b);
  if((yl>=0)&(yu<=0))|((yl<=0)&(yu>=0))
    count(k_a,k_b)=count(k_a,k_b)+1;
    for j=1:1:20;
      mb=(lb+ub)/2;
      ym=mg_pp(mb,a,b);
      if(sign(yl)==sign(ym))
        lb=mb;yl=ym;
      else
        ub=mb;yu=ym;
      end
      root_fpp(k_a,k_b,count(k_a,k_b))=mb;
      val_fpp(k_a,k_b)=ym;
    end %for j
  end %ifsign
%  count
%  root_pp
%  pause
end %for i
  end % for k_a
end  %for k_b 
%figure;
%surf(ar,br,root_pp)
%figure;
%surf(ar,br,count)
%pause;
save ar
save br
save count
save root_fpp

