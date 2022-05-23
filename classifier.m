function cost = classifier(X,y,numFolds, mdl_type)

numVectors = size(X,1);
cvPartitions = cvpartition(numVectors,"KFold",numFolds);

TrainIndex = training(cvPartitions,numFolds);
TestIndex = test(cvPartitions,numFolds);

XTrain = X(TrainIndex,:);
yTrain = y(TrainIndex);

XTest = X(TestIndex,:);
yTest = y(TestIndex);

if mdl_type=='knn'
    mdl = fitcknn(XTrain,yTrain','NumNeighbors',1);
    yTest_mdl = predict(mdl,XTest);
    cost = numel( find(yTest_mdl == yTest'))/numel(yTest');
elseif mdl_type=='svm'
    mdl = fitcsvm(XTrain, yTrain');
    yTest_mdl = predict(mdl,XTest);
    cost = numel( find(yTest_mdl == yTest'))/numel(yTest');

end %function