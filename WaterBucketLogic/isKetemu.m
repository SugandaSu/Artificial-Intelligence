function ketemu = isKetemu(sKeadaan, tujuan)

jKeadaan = size(sKeadaan,1);
ketemu = false;
if (sKeadaan(jKeadaan,1) == tujuan) || (sKeadaan(jKeadaan,2) == tujuan)
    ketemu = true;
end