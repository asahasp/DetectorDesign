
count = 0;
bound(1) = 0;

N = 51;
x = zeros(1,N);
gainpp_f=zeros(1,N);
char_f =zeros(1,N); 
gain_f = zeros(1,N);

bound = zeros(1,5);
val = zeros(1,5);
arg_ext = zeros(1,3);
val_ext = zeros(1,3);

a = 0.6;
b = 10;
% bisection for zeros of f_pp
for i=1:1:N;
  lb=(i-1)*2/(N-1);ub=i*2/(N-1);
  yl=mg_pp(lb,a,b);
  yu=mg_pp(ub,a,b);
  if((yl>=0)&(yu<=0))|((yl<=0)&(yu>=0))
    count=count+1;
    for j=1:1:20;
      mb=(lb+ub)/2;
      ym=mg_pp(mb,a,b);
      if(sign(yl)==sign(ym))
        lb=mb;yl=ym;
      else
        ub=mb;yu=ym;
      end
      bound(count+1)=mb;
 %     val(count+1)=ym;  
    end %for j
  end %ifsign     
end %for i
count
bound(count+2)=2;

for i=1:(count+1)
%  gainpp_f(i)=mg_pp(bound(i),a,b);
  val(i) = 1-2*gcfmg(bound(i),a,b);
end
bound
%val
%pause;

%for i=1:N
%  x(i) = bound(2) + (bound(4)-bound(2))*(i-1)/(N-1);
%  gainpp_f(i)=mg_pp(x(i),a,b);
%  char_f(i) = 1-2*gcfmg(x(i),a,b);
%  num = 2*(pdf_mg(x(i),a,b)^2);
%  den = (1 - cdf_mg(x(i),a,b))/2;
%  gain_f(i) = num/den;
%end
%figure;
%plot(x,gainpp_f);
%figure;
%plot(x,char_f);
%figure;
% plot(x,gain_f);

% bisection for extrema of G_p
for i=1:1:count;
  lb=bound(i);ub=bound(i+1);
  yl=1-2*gcfmg(lb,a,b);
  yu=1-2*gcfmg(ub,a,b);
%  if((yl>=0)&(yu<=0))|((yl<=0)&(yu>=0))
    mb=(lb+ub)/2;
    ym=1-2*gcfmg(mb,a,b);
    for j=1:1:40;      
      if(sign(yl)==sign(ym))
        lb=mb;yl=ym;
      else
        ub=mb;yu=ym;
      end
    end %for j
    arg_ext(i)=mb;
    num = 2*(pdf_mg(mb,a,b)^2);
    den = (1 - cdf_mg(mb,a,b))/2;
    val_ext(i) = num/den;  
%  end %ifsign     
end %for i
arg_ext
val_ext
[gm,ind_gm]=max(val_ext);
arg_gm = arg_ext(ind_gm);
gm
arg_gm