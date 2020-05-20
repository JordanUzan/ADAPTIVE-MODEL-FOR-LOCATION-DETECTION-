uiopen('E:\Fulltextfiles.xlsx',1);%we have to change this everytime as we change the name of the file 
distance=table2array(Fulltextfiles(:,12));
load('trainmodel22ksamples.m');
yfit=trainmodel22ksamples.predictFcn(Fulltextfiles);
abs_dist_err=abs(yfit-distance);
abs_per_dist_err=transpose(transpose(abs_dist_err)./transpose(distance)*100);
distancetable=table(distance,yfit,abs_dist_err,abs_per_dist_err);
%to find the success of the validation and the regression we use 
success=(sum(abs_per_dist_err<20)/length(distance))*100;

