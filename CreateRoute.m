%--------------------------------------------------------------------------
%function featindex = CreateRoute(dim, n_ant, n_feat, tau, alpha, eta,beta)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%featindex: seçilen özelliklerin öznitelik matrisindeki konumları.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%dim:öznitelik sayısı
%n_ant: karınca sayısı
%n_feat: seçilecek özellik sayısı
%tau: feromon miktarı
%alpha:feromon ağırlıklarını ayarlama faktörü
%eta:sezgisel parametre
%beta:eta ağırlıklarını ayarlama faktörü
%--------------------------------------------------------------------------

function featindex = CreateRoute(dim, n_ant, n_feat, tau, alpha, eta,beta)

featx = zeros(n_ant,n_feat);          %seçilecek özntielikleri tutmak için boş matris oluşturuyouz.

for ant = 1: n_ant                    %karıncaları hareket ettiren döngü.
    featx(ant,1) = randi([1, dim]);   %karıncaların başlangıç konumları random belirlenir.
    pathx = [];                       %karıncalarının gittiği yolların tutulması için boş matris oluşturulur.
    
    for step = 2:n_feat               %karıncaların rotaları belirleniyor
        pathx = [pathx(1:end), featx(ant,step-1)];      %karıncaların konumları path matrisine kaydediliyor.
        prob = probability(pathx, tau,alpha, eta, beta);%konumların skorlarına göre seçilme olasılıkları
                                                        %hesaplanıyor.
        path_step = rouletteSelection(prob);                %bir sonraki konum rastgele seçilir.
        featx(ant,step) = path_step;                  %seçilen konumlar rota matrisine eklenir.
        featindex = featx;
    end%for

end %for
end %function