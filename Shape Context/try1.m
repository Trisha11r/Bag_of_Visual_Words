BW = ~im2bw(imread('B.bmp'));
[B,L,N] = bwboundaries(BW);
% figure; imshow(BW); 
hold on;
for k=1:length(B),
    boundary = B{k};
    if(k > N)
        plot(boundary(:,2),...
            boundary(:,1),'black','LineWidth',1);
    else
        plot(boundary(:,2),...
            boundary(:,1),'black','LineWidth',1);
    end
end