function acc = DoAllFolds(X, y, numFolds,mdl_type)

numVectors = size(X,1);

cvPartitions = cvpartition(numVectors,'KFold',numFolds);
acc = zeros(numFolds,1);

for ind= 1:numFolds
    acc(ind) = DoOneFold(X, y, cvPartitions,ind, mdl_type);
end
