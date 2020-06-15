function [matchList,matches,kp1,kp2,dist] = CompareImages()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[X1,map1]=imread('.\test\words\w13.jpg');
% [X2,map2]=imread('.\training\cropped_logo\004.jpg');
[X2,map2]=imread('.\test\words\w12.jpg');
X1ff=X1;
X2ff=X2;
X11=invert(X1);
X21=invert(X2);
% figure,imtool(X11);
% figure,imtool(X21);
% pause;
[matchList,matches,kp1,kp2,mp,dist]=matchFeatures(X11,X21);
disp('per');
disp(mp);
a=uint8(dist);
[o,p]=imhist(a);
stem(o);
% pause;
% figure,imshow(X1);
% hold on;
% for i=1:matches
%     scatter(matchList(i).y1,matchList(i).x1,30,[1,1,0],'filled');
% %     X1f=insertShape(X1, 'circle', [(matchList(i).y1) (matchList(i).x1) 1], 'LineWidth', 2,'Color','r');
% %     X2f=insertShape(X2, 'circle', [(matchList(i).y2) (matchList(i).x2) 1], 'LineWidth', 2,'Color','r');
% %     X1ff=insertShape(X1ff, 'circle', [(matchList(i).y1) (matchList(i).x1) 1], 'LineWidth', 2,'Color','r');
% %     X2ff=insertShape(X2ff, 'circle', [(matchList(i).y2) (matchList(i).x2) 1], 'LineWidth', 2,'Color','r');
% %     
% %     subplot(1,2,1), imshow(X1f,map1,'Border','tight')
% %     subplot(1,2,2), imshow(X2f,map2,'Border','tight')
% %     pause(2);
% end
%  hold off;
% figure, imshow(X2);
% hold on;
% for i=1:matches
%     scatter(matchList(i).y2,matchList(i).x2,30,[1,1,0],'filled');
% end 
% 
% % subplot(1,2,1), imshow(X1ff,map1,'Border','tight')
% % subplot(1,2,2), imshow(X2ff,map2,'Border','tight')
    
end

