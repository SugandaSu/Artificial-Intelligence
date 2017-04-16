function tLewat = isLewat(sKeadaan, keadaan)

jKeadaan = size(sKeadaan, 1);
tLewat = false;
for i = 1: jKeadaan
    if (keadaan(1) == sKeadaan(i,1)) && (keadaan(2) == sKeadaan(i,2))
        tLewat = true;
    end
end