function [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,keadaan,sAsal,asal,sKejadian,skejadian,kejadian)

ada = isLewat(sKeadaan, keadaan);
jKeadaan = size(sKeadaan, 1) + 1;
if ~ada
    sKeadaan(jKeadaan,1) = keadaan(1);
    sKeadaan(jKeadaan,2) = keadaan(2);
    sAsal(jKeadaan) = asal;
    sKejadian(jKeadaan) = skejadian(kejadian);
end