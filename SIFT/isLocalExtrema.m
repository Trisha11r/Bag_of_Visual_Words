function [v] =isLocalExtrema(imlist,index,i,j,f)
%UNTITLED2 Summary of this function goes hereDetailed explanation goes here
val=imlist{index}(i,j);
v=0;
if (imlist{index+f}(i-1,j-1)>val&&imlist{index+f}(i-1,j)>val&&imlist{index+f}(i-1,j+1)>val&&imlist{index+f}(i,j-1)>val&&imlist{index+f}(i,j+1)>val&&imlist{index+f}(i+1,j-1)>val&&imlist{index+f}(i+1,j)>val&&imlist{index+f}(i+1,j+1)>val)||(imlist{index+f}(i-1,j-1)<val&&imlist{index+f}(i-1,j)<val&&imlist{index+f}(i-1,j+1)<val&&imlist{index+f}(i,j-1)<val&&imlist{index+f}(i,j+1)<val&&imlist{index+f}(i+1,j-1)<val&&imlist{index+f}(i+1,j)<val&&imlist{index+f}(i+1,j+1)<val)
    v=1;
end
if(v==1&&f==1&&(imlist{index+f}(i,j)>val||imlist{index+f}(i,j)<val))
    v=1;
end
if(v==1&&f==-1&&(imlist{index+f}(i,j)>val||imlist{index+f}(i,j)<val))
    v=1;
end 
end

