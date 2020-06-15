function [dist] = calcDist(d1,d2,t1,t2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dist=0;
for i=1:16
    if(d1(i)>d2(i))
        d2(i)=d2(i)/d1(i);
        d1(i)=d1(i)/d1(i);                
    else if d2(i)~=0
        d1(i)=d1(i)/d2(i);
        d2(i)=d2(i)/d2(i);
        end
    end
    dist=dist+d1(i)*d2(i)*cos(deg2rad(t1(i)-t2(i)));
end
dist=(dist+16);
end

