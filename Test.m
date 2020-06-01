close all;
clear all;
clc;


%---load the trained SVM model-------------------------------
load('SVM_Model.mat');


%---- path of the folder where test images are stored--------
S = dir('/home/shan/Desktop/MilkAdulteration/*.jpg');


%---- Testing each image in the folder and Classifying-------

for i=1:numel(S)
    
    img = imread(S(i).name);
    
    %--- mean values of each plane ----
    r = mean(mean(img(:,:,1)));
    g = mean(mean(img(:,:,2)));
    b = mean(mean(img(:,:,3)));
    
    test_sample = [r,g,b];
    
    %---- predicting the label ----
    [pred,score] = predict(Mdl,test_sample);
    
    if pred == 1
        disp('Adulterated Milk with acidic pH');
    else if pred == 2
            disp('Pure Milk');
        else
            disp('Adulterated Milk with basic pH');
        end
    end
    
    
end


%--------------------
