function [points] = getPoints(im)
BW=~im;
[rr cc t]=size(BW);
im1=zeros(rr,cc);
[B,L,N] = bwboundaries(BW);
points=[];
i=1;
skip=4;
% if rr*cc<70*70
%     skip=1;
% else 
%     skip=idivide(int32(rr*cc),int32(70*70),'Fix')+1;
% end
for k=1:length(B),
    boundary = B{k};
    [r c t]=size(boundary);
    for j=1:skip:r
%         disp(j);
        if ~(boundary(j,1)==1||boundary(j,1)==rr||boundary(j,2)==1||boundary(j,2)==cc)
            points(i).x=boundary(j,1);
            points(i).y=boundary(j,2);
            points(i).desc=zeros(1,36);
            im1(points(i).x,points(i).y)=1;
            i=i+1;
        end
    end
end
   %figure,imshow(im1);

end

