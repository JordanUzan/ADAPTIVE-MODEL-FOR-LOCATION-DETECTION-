uiopen('F:\Machine learning 15th June\70kdataset\Datasetfordistnacepredictor.xlsx',1);
distance=table2array(Datasetfordistnacepredictor(:,12));
load('trainmodel71ksamples.m');
yfit=trainmodel71ksamples.predictFcn(Datasetfordistnacepredictor);
abs_dist_err=abs(yfit-distance);
abs_per_dist_err=transpose(transpose(abs_dist_err)./transpose(distance)*100);
distancetable=table(distance,yfit,abs_dist_err,abs_per_dist_err);
%to find the success of the validation and the regression we use 
success=(sum(abs_per_dist_err<20)/length(distance))*100;
