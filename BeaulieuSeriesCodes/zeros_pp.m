
function [count,root_pp] = zeros_pp(a,b)

% called by new_rootmg.m
%a = 0.3;b=5;
count = 0;
root_pp = zeros(1,4);
val_pp = zeros(1,4);

for i=1:1:21;
  lb=(i-1)/10;ub=i/10;
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
      root_pp(count)=mb;
      val_pp(count)=ym;
    end %for j
  end %ifsign
end %for i
%count
%root_pp
%val_pp
