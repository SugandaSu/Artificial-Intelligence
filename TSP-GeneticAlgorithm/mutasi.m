function output = mutasi(generasi, config)

induk = seleksi(generasi.fitness, config, 'min');
[y x] = size(generasi.populasi(1,:));

A = randi([1 x]);
B = randi([1 x]);
mutasi = generasi.populasi(induk,:);
tempM = mutasi(B);
mutasi(B) = mutasi(A);;
mutasi(A) = tempM;

output = mutasi;

end