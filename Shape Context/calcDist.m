function [dist] = calcDist(d1,d2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dist=0;
for i=1:36
    dist=dist+(d1(i)-d2(i))*(d1(i)-d2(i))/(d1(i)+d2(i)+1);
end
dist=dist/2;
end

