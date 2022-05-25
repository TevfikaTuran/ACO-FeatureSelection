%--------------------------------------------------------------------------
%function fit = objfunction(X,y,feat,numFolds)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%%fit: uygunluk değeri.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%X:Öznitelik matrisi
%y:Sınıf marisi
%feat: seçilen öznitelikler.
%numFolds: cross-validation için fold değeri
%--------------------------------------------------------------------------

%Seçilen özniteliklerin uygunluk değerleri belirlenir.
function fit = objfunction(X,y,feat,numFolds,mdl_type)

%sadece seçilen öznitelikler ile eğitim yapılarak doğruluk değerleri
%hesaplanır
cost = mdl_classifier( X(:,feat),y,numFolds,mdl_type);

% fit = -log(cost);
fit = 1-cost; %1- acuuracy ile hatayı buluruz (amacımız hatayı minimize etmek)