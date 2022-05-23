%--------------------------------------------------------------------------
%function [sfeatindex , sfeat, fitnes] = ACOFeatureSelection(X,y,dim,n_ant,...
%            n_feat,bestFit,tau, alpha,eta, beta, rho,numFolds, maxiter)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%sfeatindex: seçilen özelliklerin öznitelik matrisindeki konumları.
%sfeat: seçilen öznitelikler.
%fitnes: her iterasyondaki en iyi uygunluk değeri.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%X:Öznitelik matrisi
%y:Sınıf marisi
%dim:öznitelik sayısı
%n_ant: karınca sayısı
%n_feat: seçilecek özellik sayısı
%bestFit: başlangıçtaki en iyi uygunluk değeri
%tau: feromon miktarı
%alpha:feromon ağırlıklarını ayarlama faktörü
%eta:sezgisel parametre
%beta:eta ağırlıklarını ayarlama faktörü
%rho: buharlaşma oranı.
%numFolds: cross-validation için fold değeri
%maxiter: maksimum iterasyon sayısı
%--------------------------------------------------------------------------

function [sfeatindex , sfeat, fitnes] = ACOFeatureSelection(X,y,dim,n_ant,...
    n_feat,bestFit,tau, alpha,eta, beta, rho,numFolds,numExperiments,mdl_type, maxiter) 

fit = zeros(1,n_ant); %güncellenen fitnes değerlerini tutmak için matris oluştururuz.
fitnes = [];%her iterasyondaki en iyi fitnes değerini tutmak için boş matris oluşturuyoruz.

iter = 1;
while (1) %ana döngü

    %sırayla seçilen öznitelikleri belirleme.
    featindex = CreateRoute(dim, n_ant, n_feat, tau, alpha, eta,beta);
    
    %seçilen öznitliklerin uygunluk değeri hesaplanıp önceki uygunluk
    %değerleri ile karşılaştırılır.
    for i = 1: n_ant 
        fit(i) = objfunction(X,y,featindex,numFolds,numExperiments,mdl_type);

        if fit(i) < bestFit
           bestfeat = featindex(i,:);
           bestFit = fit(i);  
        end % if

    end % for
    
    tour = bestfeat; %k. karıncanın seçtiği en iyi rota.
    tour = [tour(1:end),tour(1)]; %2. iterasyon için başlangıç noktaları belirlendi
    tau = pheromoneUpdate(tour,rho,tau, bestFit); %ilk rotalara göre feromon 
                                                  % güncellemeleri yapıldı
    fitnes(iter) = bestFit; %iterasyondaki en iyi uygunluk değeri matrise kaydedildi
    fprintf('\nIteration = %d BestFitness = %f', iter, bestFit);
    iter = iter +1;
    
    %% DURMA KRİTERLERİ
    if iter == maxiter + 1 || bestFit == 0
        break;
    end% if

end % while
sfeatindex = unique(bestfeat);%seçilen özelliklerin öznitelik matrisindeki konumları
                              %aynı rotanın tekrar seçilmemesi için unique
                              %komutunu kullanıyoruz.
sfeat = X(:, sfeatindex);     %seçilen özellikleri öznitelik matrisimizden çekiyoruz
end
