function [keypoints] = sift1(im,k,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r c t]=size(im);
imlist1={im,im,im,im,im,im};
ima=zeros(r,c);
imlist={ima,ima,ima,ima};
%imshow(imlist{1});
% disp(r);
% disp(c);
% disp(t);
for i=2:6
%     tic;
    h=fspecial('gaussian',size(imlist1{1}),sigma);
    imlist1{i}=imfilter(imlist1{1},h);        
    if i~=2
        imlist{i-2}=sub(imlist1{i},imlist1{i-1});
%         imshow(imlist{i-2});
%         pause;
    end
    sigma=k*sigma;
%     disp(1/toc);
%   figure,imshow(imlist{i});title(i);
end
disp('Finding Extrema:');
count=0;
keypoints=[];
points=1;
for index=2:3
%     tic;
    [gx, gy] = gradient(double(imlist{index}));
    [gxx, gxy] = gradient(gx);
    [gxy, gyy] = gradient(gy);
    for i=2:r-1
        for j=2:c-1
            %val=imlist{index}(i,j);
             if(isLocalExtrema(imlist,index,i,j,0)==1 && isLocalExtrema(imlist,index,i,j,1)==1 && isLocalExtrema(imlist,index,i,j,-1)==1)
                 alpha=gxx(i,j)+gyy(i,j);
                 beta=gxx(i,j)*gyy(i,j)-gxy(i,j)*gxy(i,j);
                 ratio=(alpha+beta)*(alpha+beta)/alpha/beta;
                 if(ratio<10)
                    %im=insertShape(im, 'circle', [i j 1], 'LineWidth', 5);
                    count=count+1;
                    keypoints(points).x=i;
                    keypoints(points).y=j;            
                    keypoints(points).scale=1;
                    keypoints(points).desc=zeros(16,1);
                    keypoints(points).descdir=zeros(16,1);
                    keypoints(points).neighbourhood=zeros(16,16);
%%                  orientation & description
                    Hist=[];
                    for ii=1:36
                        Hist(ii).angle=(ii-1)*10+4.5;
                        Hist(ii).mag=0;
                    end
                    xStart=i-1;
                    xEnd=i+1;
                    if xStart<2
                        xStart=2;
                        xEnd=xEnd+1;
                    end
                    if xEnd>r-1
                        xEnd=r-1;
                        xStart=xStart-1;
                    end
                    yStart=j-1;
                    yEnd=j+1;
                    if yStart<2
                        yStart=2;
                        yEnd=yEnd+1;
                    end
                    if yEnd>c-1
                        yEnd=c-1;
                        yStart=yStart-1;
                    end
                    for xx=xStart:xEnd
                        for yy=yStart:yEnd
                            v1=imlist{index}(xx+1,yy)-imlist{index}(xx-1,yy);
                            v2=imlist{index}(xx,yy+1)-imlist{index}(xx,yy-1);
                            v=(v1*v1+v2*v2);                    
                            m=sqrt(double(v));
                            theta=rad2deg(atan2(double(v2),double(v1)));
                            if theta<0
                                theta= theta +360;
                            end
                            indexes=idivide(int32(theta),int32(10),'fix');
                            Hist(indexes+1).mag=Hist(indexes+1).mag+m;
                        end
                    end
                    Hist=nestedSortStruct(Hist,'mag');
                    orient=Hist(36).angle;
                    keypoints(points).orient=orient;
                    xStart=i-7;
                    xEnd=i+8;
                    if xStart<2                        
                        xEnd=xEnd+(2-xStart);
                        xStart=2;
                    end
                    if xEnd>r-1
                        xStart=xStart-(xEnd-r+1);
                        xEnd=r-1;
                    end
                    yStart=j-7;
                    yEnd=j+8;
                    if yStart<2                        
                        yEnd=yEnd+(2-yStart);
                        yStart=2;
                    end
                    if yEnd>c-1
                        yStart=yStart-(yEnd-c+1);
                        yEnd=c-1;
                    end
                    for jj=1:4
                        for kk = 1:4                                                  
                            Histo=[];
                            for ii=1:8
                                Histo(ii).angle=45*(ii-1);
                                Histo(ii).mag=0;
                            end
                            for xx=xStart+4*(jj-1):xStart+4*jj-1
                                for yy=yStart+4*(kk-1):yStart+4*kk-1
                                    keypoints(points).neighbourhood(xx-xStart+1,yy-yStart+1)=imlist{index}(xx,yy);
                                    v1=imlist{index}(xx+1,yy)-imlist{index}(xx-1,yy);
                                    v2=imlist{index}(xx,yy+1)-imlist{index}(xx,yy-1);
                                    v=(v1*v1+v2*v2);
                                    m=sqrt(double(v));
                                    theta=rad2deg(atan2(double(v2),double(v1)));
                                    if theta<0
                                        theta= theta +360;
                                    end
%                                     theta1= orient-theta;
                                    theta1=theta;
                                    indexes=idivide(int32(theta1),int32(45),'fix');
                                    if theta1>0
                                        Histo(1+indexes).mag=Histo(1+indexes).mag+m;
                                    else
                                        Histo(8+indexes).mag=Histo(8+indexes).mag+m;
                                    end
                                end
                            end
                            maxi=Histo(1).mag;
                            maxiAng=Histo(1).angle;
                            for ii=2:8
                                if(Histo(ii).mag>maxi)
                                    maxi=Histo(ii).mag;
                                    maxiAng=Histo(ii).angle;                            
                                end
                            end
                            keypoints(points).desc((jj-1)*4+kk)=maxi;
                            keypoints(points).descdir((jj-1)*4+kk)=maxiAng;
                        end
                    end
%%                  
                    v=0.0; 
%                     for ii=1:16
%                         v=v+keypoints(points).desc(ii)*keypoints(points).desc(ii);
%                     end
%                     v=sqrt(v);
%                     for ii=1:16
%                         keypoints(points).desc(ii)=keypoints(points).desc(ii)/v;
%                     end
                    points=points+1;
                 end
             end
        end
    end
%     disp(1/toc);
end
% imshow(im);
 disp(count);
%  disp(keypoints);
end

