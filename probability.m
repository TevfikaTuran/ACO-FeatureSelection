%--------------------------------------------------------------------------
%function prob = probability(path, tau,alpha, eta, beta)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%prob:bir sonraki konumun seçilme olasılığı.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%path: şimdiye kadarki alınan yol matrisi.
%tau: feromon miktarı
%alpha:feromon ağırlıklarını ayarlama faktörü
%eta:sezgisel parametre
%beta:eta ağırlıklarını ayarlama faktörü
%--------------------------------------------------------------------------

function prob = probability(pathx, tau,alpha, eta, beta)
%--------------------------------------------------------------------------
%            ((T_xy )^α (n_xy )^β)
%  Pxy^k=  --------------------------
%           (∑((T_xz )^α (n_xz )^β))
%--------------------------------------------------------------------------
p = tau(pathx(end),:).^alpha .*eta(pathx(end),:).^beta; %Bir sonraki konumun seçilme olasılığı formülü.
p(pathx) = 0; %şu an bulunduğumuz konumun bir sonraki adımda seçilme olasılığını sıfıra eşitler.
prob = p./sum(p(:));%Bir sonraki konumun seçilme olasılığı formülü.

end