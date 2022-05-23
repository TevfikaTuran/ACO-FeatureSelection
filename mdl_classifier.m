%--------------------------------------------------------------------------
%function cost = knn_classifier(X, y, numFolds)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%%cost: doğruluk değeri.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%X:Öznitelik matrisi
%y:Sınıf marisi
%numFolds: cross-validation için fold değeri
%--------------------------------------------------------------------------
function cost = mdl_classifier(X, y, numFolds,mdl_type)

if mdl_type=='knn'
    mdl = fitcknn(X, y, "NumNeighbors",1);
    cvmdl = crossval(mdl,'KFold',numFolds); %eğittiğimiz modele cross-validation uyguluyoruz.
    yFit = kfoldPredict(cvmdl); %modelimize tahmin yaptırarak doğruluk değerini alıyoruz
elseif mdl_type =='svm'
    mdl = fitcsvm( X, y); %özniteliklerimizi SVM algoritması ile modeli eğitiyoruz.
    cvmdl = crossval(mdl,'KFold',numFolds); %eğittiğimiz modele cross-validation uyguluyoruz.
    yFit = kfoldPredict(cvmdl); %modelimize tahmin yaptırarak doğruluk değerini alıyoruz
elseif mdl_type == 'multi_svm'
    mdl = fitcecoc( X, y); %özniteliklerimizi SVM algoritması ile modeli eğitiyoruz.
    cvmdl = crossval(mdl,'KFold',numFolds); %eğittiğimiz modele cross-validation uyguluyoruz.
    yFit = kfoldPredict(cvmdl);
end % if
val = confusionmat(yFit,y');%shg
TP = val(1,1);
TN = val(2,2);
FP = val(2,1);
FN = val(1,2);
cost = (TP+TN)/(TP+TN+FP+FN);%accuracy formülü