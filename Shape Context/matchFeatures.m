function [matchList,matches,kp1,kp2,matchPercentage,distList] = matchFeatures( im1,im2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
kp1=getPoints(im1);
% pause;
kp1=addFeatures(kp1);
% pause;
kp2=getPoints(im2);
% pause;
kp2=addFeatures(kp2);
% pause;
matchList=[];
distList=[];
matches=0;
[r1 c1]=size(kp1);
[r2 c2]=size(kp2);
check=zeros(c2,1);
%disp(c2);
for i=1:c1
    distances=[];
    for j=1:c2
        %if(abs(kp1(i).x-kp2(j).x)<=15&&abs(kp1(i).y-kp2(j).y)<=15)            
            distances(j).dist = calcDist(kp1(i).desc,kp2(j).desc);
        %else
        %   distances(j).dist=100; 
        %end
        distances(j).pt=j;
    end
    if(c2>2)
        distances=nestedSortStruct(distances,'dist');
    end
    %disp(distances(1).dist);
%     disp('displaying');
%     for j=1:c2
%         disp(distances(j).dist);
%         disp(distances(j).pt);
%     end
%      disp('***********************');
     if c2~=0
            if c2~=1%&&distances(1).dist<=0.09%distances(2).dist%&&check(distances(1).pt)<1
                %if(abs(kp1(i).x-kp2(distances(1).pt).x)<=15&&abs(kp1(i).y-kp2(distances(1).pt).y)<=15)
                 matches=matches+1;
                 matchList(matches).x1=kp1(i).x;
                 matchList(matches).y1=kp1(i).y;
                 matchList(matches).desc1=kp1(i).desc;
                 matchList(matches).x2=kp2(distances(1).pt).x;
                 matchList(matches).y2=kp2(distances(1).pt).y;
                 matchList(matches).desc2=kp2(distances(1).pt).desc;
                 distList(matches)=int32(1000*distances(1).dist);
                 check(distances(1).pt)=check(distances(1).pt)+1;
                 
%                  disp('x');
%                  disp(abs(kp1(i).x-kp2(distances(1).pt).x));
%                  disp('y');
%                  disp(abs(kp1(i).y/kp2(distances(1).pt).y));
%                  disp('dist');
                 %disp(distances(1).dist);
                %end
            end
    end
end
matchPercentage=(50*matches/c1);
%disp('Per');
%disp(matchPercentage);
end

