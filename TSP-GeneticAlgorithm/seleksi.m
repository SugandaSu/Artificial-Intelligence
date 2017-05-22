function output = seleksi(fitness, config, jenis)

tournament = randi([1 config.jumlahPop], 1, config.jumlahTourn);
if jenis == 'min'
    [x output] = min(fitness(tournament));
else
    [x output] = max(fitness(tournament));
end

end