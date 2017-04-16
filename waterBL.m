function waterBL = waterBL(maxA, maxB, tujuan)
sKeadaan = [0,0];
sKejadian = {'A dan B kosong'};
kejadian = {'Isi ember A','Isi ember B','Kosongkan ember A','Kosongkan ember B','Ember A ke ember B','Ember B ke ember A'};
sAsal = [1];
asal = 1;
ketemu = false;

while ~ketemu
    disp(1)
    nilaiA = sKeadaan(asal,1);
    nilaiB = sKeadaan(asal,2);
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[maxA,nilaiB],sAsal,asal,sKejadian,kejadian,1);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[nilaiA,maxB],sAsal,asal,sKejadian,kejadian,2);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[0,nilaiB],sAsal,asal,sKejadian,kejadian,3);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[nilaiA,0],sAsal,asal,sKejadian,kejadian,4);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    penuhB = min(nilaiA,maxB - nilaiB);
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[nilaiA-penuhB,nilaiB+penuhB],sAsal,asal,sKejadian,kejadian,5);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    penuhA = min(maxA - nilaiA,nilaiB);
    [sKeadaan,sAsal,sKejadian] = addNode(sKeadaan,[nilaiA+penuhA,nilaiB-penuhA],sAsal,asal,sKejadian,kejadian,6);
    if isKetemu(sKeadaan,tujuan);
        break;
    end
    asal = asal + 1;
end

tampilkanSolusi(sKeadaan,sAsal,sKejadian);