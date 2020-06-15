function [points] = addFeatures(points)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[r,c,t]=size(points);
for i=1:c    
     for j=1:c
        if i==j
            continue;
        end
        v1=points(j).x-points(i).x;
        v2=points(j).y-points(i).y;
        mag=sqrt(double(v1*v1+v2*v2));
        if mag~=0&&mag<50
            theta=rad2deg(atan2(double(v2),double(v1)));
            if theta<0
                theta= theta +360;
            end
            indexes=idivide(floor(theta),int32(10),'fix');
            points(i).desc(1+indexes)=points(i).desc(1+indexes)+10/mag;
        end
    end
    v=0.0; 
    for ii=1:36
        v=v+points(i).desc(ii)*points(i).desc(ii);
    end
    v=sqrt(v);
    for ii=1:36
        points(i).desc(ii)=points(i).desc(ii)/v;
    end
end

end

