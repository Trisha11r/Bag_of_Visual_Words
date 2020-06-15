function [matchList,matches,kp1,kp2] = CompareImages()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[X1,map1]=imread('./test/words/w1.png');
% [X2,map2]=imread('.\training\cropped_logo\004.jpg');
[X2,map2]=imread('./bag of words/test/words/w2.png');
X1ff=X1;
X2ff=X2;
[matchList,matches,kp1,kp2]=matchFeatures(X1,X2);
disp('matches');
disp(matches);
pause;
figure,imshow(X1);
hold on;
for i=1:matches
    scatter(matchList(i).x1,matchList(i).y1,30,[1,1,0],'filled');
%     X1f=insertShape(X1, 'circle', [(matchList(i).y1) (matchList(i).x1) 1], 'LineWidth', 2,'Color','g');
%     X2f=insertShape(X2, 'circle', [(matchList(i).y2) (matchList(i).x2) 1], 'LineWidth', 2,'Color','g');
%     X1ff=insertShape(X1ff, 'circle', [(matchList(i).y1) (matchList(i).x1) 1], 'LineWidth', 2,'Color','g');
%     X2ff=insertShape(X2ff, 'circle', [(matchList(i).y2) (matchList(i).x2) 1], 'LineWidth', 2,'Color','g');
    
%     subplot(1,2,1), imshow(X1f,map1,'Border','tight')
%     subplot(1,2,2), imshow(X2f,map2,'Border','tight')
%     pause(2);
end
hold off;
figure, imshow(X2);
hold on;
for i=1:matches
    scatter(matchList(i).x2,matchList(i).y2,30,[1,1,0],'filled');
end 
% subplot(1,2,1), imshow(X1ff,map1,'Border','tight')
% subplot(1,2,2), imshow(X2ff,map2,'Border','tight')
    
end

