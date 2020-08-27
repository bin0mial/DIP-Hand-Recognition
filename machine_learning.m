function [ YTest ] = machine_learning( trained_path, test_image_path, retrain_network )
%machine_learning Summary of this function goes here
%   Detailed explanation goes here

digitDatasetPath = trained_path;
digitData = imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'LabelSource','foldernames');
testDigitData = imageDatastore(test_image_path, 'IncludeSubfolders',true,'LabelSource','foldernames');
layers = [imageInputLayer([128 128 1]);
          convolution2dLayer(30, 25);
          maxPooling2dLayer(2,'Stride',2);
          fullyConnectedLayer(6);
          softmaxLayer();
          classificationLayer()];
options = trainingOptions('sgdm','MaxEpochs',20,...
	'InitialLearnRate',0.01);
if retrain_network
net = trainNetwork(digitData,layers,options);
save('mlearn', 'net');
else
    if exist('mlearn.mat', 'file') == 2
        load('mlearn');
    else
        net = trainNetwork(digitData,layers,options);
        save('mlearn', 'net');
    end
end
YTest = classify(net,testDigitData);
output = ['Hand recogintion number is ' char(YTest)];
msgbox(output,'Output');

end

