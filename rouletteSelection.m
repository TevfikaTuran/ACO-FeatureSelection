%--------------------------------------------------------------------------
%function route = rouletteSelection(prob)
%--------------------------------------------------------------------------
%çıkış parametreleri
%--------------------------------------------------------------------------
%route: bir sonraki konum için seçilen nokta.
%--------------------------------------------------------------------------
%giriş parametreleri
%--------------------------------------------------------------------------
%prob:bir sonraki konumun seçilme olasılığı.
%--------------------------------------------------------------------------

function route = rouletteSelection(prob)

c = cumsum(prob);   %daha önceki seçilme olasılıklarının toplamı.
p = rand();         %random değer oluşturma.

    for i = 1: length(c)%seçme

        if c(i) > p   %random oluşturduğumuz olasılık değerine göre konumların seçilme olasılıkları güncellenir.
            route = i;
            break;
        end %if

    end%for

end%function