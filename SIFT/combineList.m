function [kp] = combineList( kp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[r c]=size(kp);
[j k]=size(kp{1});
factor=2;
for i=2:c
   [p q]=size(kp{i}); 
   for l=1:q
       k=k+1;
       kp{1}(k)=kp{i}(l);
       kp{1}(k).x=kp{1}(k).x*factor;
       kp{1}(k).y=kp{1}(k).y*factor;
       kp{1}(k).scale=kp{1}(k).scale/factor/factor;
   end
   factor=factor*2;
end
kp=kp{1};
end

