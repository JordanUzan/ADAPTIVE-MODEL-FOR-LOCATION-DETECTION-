%to predict the distance for the 10ktraining and 60ktesting set we use the following code 
load('/Users/macbookpro/Desktop/Machine Learning 17th June /data_pre_test.mat')
load('/Users/macbookpro/Desktop/Machine Learning 17th June /data_pre_train.mat')
load('/Users/macbookpro/Desktop/Machine Learning 17th June /10ktraining60ktesting /10ktraining60ktesting.mat')
act_dist_60ktest_10ktrain=data_pre_train_table.distance_l;%this is the actual distance;
act_dist_60ktest_10ktrain(act_dist_60ktest_10ktrain==0)=0.0001;% this is to avoid the case in line9
pred_dist_60ktest_10ktrain = trainedModel.predictFcn(data_pre_train_table);%in this model we trained 11k samples are we are going to test it on 60k 
abs_dist_err_60ktest_10ktrain=abs(pred_dist_60ktest_10ktrain-act_dist_60ktest_10ktrain);%the absolute value error between the predicted distance the actual distance
abs_dist_err_per=transpose((transpose(abs_dist_err_60ktest_10ktrain)./transpose(act_dist_60ktest_10ktrain)*100));% we find out the percentage of the error of the code.
dist_pred_60ktesting_10ktraining=table(act_dist_60ktest_10ktrain,pred_dist_60ktest_10ktrain,abs_dist_err_60ktest_10ktrain,abs_dist_err_per);% we store the data in Table 
success_60ktest_10ktrain=(sum(abs_dist_err_per<10)/length(act_dist_60ktest_10ktrain))*100;% if the distance error percentage is less than then we consider it as a accurate predication
disp_res=[ 'The result of 60k testing set distance given that the training set was 10k is predicted ',num2str(success_60ktest_10ktrain),'% successfully'];
disp(disp_res);

%to predict the distance for the 60ktraining and 10ktesting set we use the following code 
load('/Users/macbookpro/Desktop/Machine Learning 17th June /data_pre_test.mat')
load('/Users/macbookpro/Desktop/Machine Learning 17th June /data_pre_train.mat')
load('/Users/macbookpro/Desktop/Machine Learning 17th June /60ktraining10ktesting /60ktraining10ktesting.mat');
act_dist_60ktrain_10ktest=data_pre_test_table.distance_l;%this is the actual distance;
act_dist_60ktrain_10ktest(act_dist_60ktrain_10ktest==0)=0.0001;% this is to avoid the case in line9
pred_dist_60ktrain_10ktest = trainedModel1.predictFcn(data_pre_test_table);%in this model we trained 11k samples are we are going to test it on 60k 
abs_dist_err_60ktrain_10ktest=abs(pred_dist_60ktrain_10ktest-act_dist_60ktrain_10ktest);%the absolute value error between the predicted distance the actual distance
abs_dist_err_per_60ktrain_10ktest=transpose((transpose(abs_dist_err_60ktrain_10ktest)./transpose(act_dist_60ktrain_10ktest)*100));% we find out the percentage of the error of the code.
dist_pred_60ktraing_10ktesting=table(act_dist_60ktrain_10ktest,pred_dist_60ktrain_10ktest,abs_dist_err_60ktrain_10ktest,abs_dist_err_per_60ktrain_10ktest);% we store the data in Table 
success_60ktrain_10ktest=(sum(abs_dist_err_per_60ktrain_10ktest<10)/length(act_dist_60ktrain_10ktest))*100;% if the distance error percentage is less than then we consider it as a accurate predication
disp_res=['The result of 60k training set distance given that the testing set was 10k is predicted ',num2str(success_60ktrain_10ktest),'% successfully'];
disp(disp_res);



