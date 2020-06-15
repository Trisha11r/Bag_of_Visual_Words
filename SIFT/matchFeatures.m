function [matchList,matches,kp1,kp2] = matchFeatures( im1,im2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
kp1=callSIFT(im1);
kp2=callSIFT(im2);
kp1=combineList(kp1);
kp2=combineList(kp2);
matchList=[];
matches=0;
[r1 c1]=size(kp1);
[r2 c2]=size(kp2);
for i=1:c1
    distances=[];
    for j=1:c2
        distances(j).dist = calcDist(kp1(i).desc,kp2(j).desc,kp1(i).descdir,kp2(j).descdir);
        distances(j).pt=j;
    end
    distances=nestedSortStruct(distances,'dist');
%     disp('displaying');
%     for j=1:c2
%         disp(distances(j).dist);
%         disp(distances(j).pt);
%     end
%      disp('***********************');
%     disp(distances(c2).dist);
     if c2~=0
           if c2~=1&&(distances(c2).dist>20&&distances(c2).dist*0.9>distances(c2-1).dist)
             matches=matches+1;
             matchList(matches).x1=kp1(i).x;
             matchList(matches).y1=kp1(i).y;
             matchList(matches).x2=kp2(distances(c2).pt).x;
             matchList(matches).y2=kp2(distances(c2).pt).y;
           end
    end
end
end

