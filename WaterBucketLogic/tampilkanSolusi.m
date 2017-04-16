function tampilkanSolusi(sKeadaan,sAsal,sKejadian);
clc;
jKeadaan = size(sKeadaan,1);
awal = sAsal(jKeadaan);
langkah(1) = jKeadaan;
jLangkah = 2;
while awal ~= 1
    langkah(jLangkah) = awal;
    jLangkah = jLangkah + 1;
    awal = sAsal(awal);
end
langkah(jLangkah) = awal;
langkah = rot90(langkah,2);

disp('Hasil: ');
disp(sKeadaan);
disp('Langkah:');
for i = 1: jLangkah
    disp(' ');
	l = langkah(i);
    keadaan = [ ' A: ' num2str(sKeadaan(l,1)) ' B: ' num2str(sKeadaan(l,2))];
    disp([sKejadian(l) keadaan]);
end

for i = 1: jKeadaan
    tujuan(i) = i;
    nama = [num2str(sKeadaan(i,1)) ',' num2str(sKeadaan(i,2))];
    sNama(i) = {nama};
end

G = graph(sAsal,tujuan,[],sNama);
G = graph(adjacency(G),sNama,'OmitSelfLoop');
BFS = bfsearch(G, 1,'allevent')
tampilkanPencarian(G,sNama,BFS);