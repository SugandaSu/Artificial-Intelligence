%membuat graph
s = [1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 4 4 4 4 4 4 5 5 5 5 5 6 6 6 6 7 7 7 8 8 9];
d = [2 3 4 5 6 7 8 9 10 3 4 5 6 7 8 9 10 4 5 6 7 8 9 10 5 6 7 8 9 10 6 7 8 9 10 7 8 9 10 8 9 10 9 10 10];
w = randi([20 100], 1, 45);
n = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J'};
G = graph(s,d,w,n);

%konfigurasi
config.Graph = G;
config.jumlahPop = 30;
config.iterasi = 10000;
config.mutasiProb = 0.3;
config.jumlahTourn = 10;
config.jumlahKeturunan = 5;

Hasil = ga(config);