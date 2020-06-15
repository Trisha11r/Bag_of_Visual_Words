function [im] = embedPoints( im,kp,factor )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r c t]=size(kp);
color='r';
if factor==2
    color='blue';
end
if factor==4
    color='green';
end
for i=1:c
    im=insertShape(im, 'circle', [(factor*kp(i).x) (factor*kp(i).y) 1], 'LineWidth', 2,'Color',color);
end
end

