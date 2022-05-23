function acc = DoAllExperiments(X, y, numExperiments, numFolds, mdl_type)

acc = zeros(numExperiments,1);

for ind= 1:numExperiments
    acc_all = DoAllFolds(X, y, numFolds, mdl_type);
    acc(ind) = mean(acc_all);
end
acc = mean(acc);