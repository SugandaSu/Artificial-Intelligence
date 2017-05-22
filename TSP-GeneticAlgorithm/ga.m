function output = ga(config)

Graph = config.Graph;
matAdj = Graph.distances;
[row,column] = size(matAdj);
jumlahPop = config.jumlahPop;
iterasi = config.iterasi;
mutasiProb = config.mutasiProb;
jumlahTourn = config.jumlahTourn;
jumlahKeturunan = config.jumlahKeturunan;

%inisialisasi populasi random
populasi = zeros(jumlahPop,column);
for i= 1: jumlahPop
    populasi(i,:) = randperm(column);
end

%variabel
globalMin = Inf;
fitness = zeros(1,column);
bestFitness = zeros(1,iterasi);

%tampilkan plot
figure('Name','TSP Menggunakan Algoritma Genetika | Proses','Numbertitle','off');
%proses evolusi
for iter= 1: iterasi
    for p= 1: jumlahPop
        jarak = matAdj(populasi(p,column),populasi(p,1));
        for i= 2: column
            jarak = jarak + matAdj(populasi(p,i-1),populasi(p,i));
        end
        fitness(p) = jarak;
    end
    
    generasi.populasi = populasi;
    generasi.fitness = fitness;
    
    %menyimpan nilai fitness terbaik
    [best,index] = min(fitness);
    bestFitness(iter) = best;
    
    if best < globalMin
        globalMin = best;
        optRoute = populasi(index,:);
        
        %tampilkan plot dengan jarak terendah
        rute = optRoute([1:column 1]);
        h = plot(gca,Graph,'o');
        
        %menghilangkan edges yang tidak digunakan
        for i= 1: column
            for j= 1: column
                if i~= j
                    highlight(h,Graph.Nodes.Name(i),Graph.Nodes.Name(j),'EdgeColor','w');
                end
            end
        end
        
        %menampilkan rute minimum
        for i= 1: column
            highlight(h,Graph.Nodes.Name(rute(i)),Graph.Nodes.Name(rute(i+1)),'EdgeColor','r');
        end
    end
    
    %menampilkan title
    title(gca,sprintf('Jarak Minimum = %d, Generasi = %d',globalMin,iter));
    drawnow;
        
    %crossover
    offsprings = crossover(generasi, config);
    for i= 1: config.jumlahKeturunan
        gagal = seleksi(generasi.fitness, config, 'max');
        if gagal ~= index
            populasi(gagal,:) = offsprings(i,:);
        end
    end
    
    %mutasi
    if rand(1) < mutasiProb,
        offspring = mutasi(generasi, config);
        gagal = seleksi(generasi.fitness, config, 'max');
        if gagal ~= index
            populasi(gagal,:) = offspring;
        end
    end
    
    if ((iter > 6000) && (bestFitness(iter-6000) == best))
        break;
    end
end

figure('Name','TSP Menggunakan Algoritma Genetika | Hasil','Numbertitle','off');
subplot(2,1,1);
imagesc(Graph.distances(optRoute,optRoute));
title('Matrix Adjacency');
subplot(2,1,2);
plot(bestFitness,'b','LineWidth',2);
title('Jejak solusi terbaik');
set(gca,'XLim',[0 iter],'YLim',[0 1.1*max([1 bestFitness])]);

hasil = struct( ...
    'Graph',            Graph, ...
    'AdjacencyM',       Graph.distances, ...
    'OptimalRute',      optRoute, ...
    'JarakTerpendek',   best);

output = hasil;
end