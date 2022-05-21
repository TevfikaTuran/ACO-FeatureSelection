%--------------------------------------------------------------------------
%function tau = pheromoneUpdate(tour,rho,tau, bestFit)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%%tau: feromon miktarı
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%tour:k. karıncanın seçtiği en iyi rota. 
%rho: buharlaşma oranı.
%tau: feromon miktarı
%bestFit:elimizdeki en iyi uygunluk değeri
%--------------------------------------------------------------------------              
%Txy^(i+1)= (1-ρ)Txy^i + ∑(ΔTxy^k)
%-------------------------------------------------------------------------- 
function tau = pheromoneUpdate(tour,rho,tau, bestFit)

    %tüm rotanın adımları gezilip feromon miktarları güncelleniyor
    for step = 1:length(tour)-1
        startloc = tour(step); %başlangıç noktası belirleniyor
        stoploc = tour(step+1);%bitiş noktası belirleniyor
        Dtau = 1/bestFit; %delta tau değeri belirleniyor
        %feromon güncelleme formülü
        tau(startloc,stoploc) = (1-rho)*tau(startloc,stoploc)+ Dtau;
    end%for
end