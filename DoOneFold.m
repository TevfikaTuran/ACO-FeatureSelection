function acc = DoOneFold(X, y, cvPartitions, numFolds, mdl_type)

pTrain = training(cvPartitions, numFolds);
pTest = test(cvPartitions, numFolds);
   
XTrain = X(pTrain,:);
yTrain = y(pTrain);
       
XTest = X(pTest,:);
yTest = y(pTest);

if mdl_type =='knn'
    mdl = fitcknn(XTrain, yTrain', 'NumNeighbors',1);
    yTest_mdl = predict(mdl, XTest);
elseif mdl_type =='svm'
   mdl = fitcsvm(XTrain, yTrain);
    yTest_mdl = predict(mdl, XTest);
end %if
acc = numel( find(yTest_mdl == yTest') ) / numel(yTest');