function [featureList,num] = genCodewordsDictionary(path)
list=dir(path);
[r,c,t]=size(list);
featureList=[];
fl=1;
num=r-2;
disp('Creating Dictionary');
for i=3:r
    disp(i-2);
    filename=strcat(path,list(i).name);
    im=imread(filename);
    imshow(im);
    kp=callSIFT(im);
    kp=combineList(kp);
    [r1 c1]=size(kp);
    for j=1:c1
        featureList(fl).x=kp(j).x;
        featureList(fl).y=kp(j).y;
        featureList(fl).desc=kp(j).desc;
        featureList(fl).descdir=kp(j).descdir;
        featureList(fl).logo=filename;
        featureList(fl).number=i-2;
        fl=fl+1;
    end
end
disp('done.');
end

