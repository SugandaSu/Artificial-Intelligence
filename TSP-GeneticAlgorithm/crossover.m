function output = crossover(generasi, config)

[y x] = size(generasi.populasi(1,:));
for i= 1: config.jumlahKeturunan
    for j= 1: 2
        induk(j) = seleksi(generasi.fitness, config, 'min');
    end
    
    awal = randi([1 x]);
    akhir = randi([awal x]);
    offspring = generasi.populasi(induk(1),awal:akhir);
    
    j = akhir - awal + 1;
    k = 1;
    while j < x
        f = false;
        for l= 1: j
            if generasi.populasi(induk(2),k) == offspring(l)
                f = true;
            end
        end
        if ~f
            j = j + 1;
            offspring(j) = generasi.populasi(induk(2),k);
        end
        k = k + 1;
    end
    
    output(i,:) = offspring;
end
end