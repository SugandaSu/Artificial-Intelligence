function tampilkanPencarian(G,sNama,pencarian)

if isa(G,'G')
    G = graph(adjacency(G),sNama,'OmitSelfLoop');
end

hasil = plot(G,'NodeColor',[0.5 0.5 0.5],'EdgeColor',[0.5 0.5 0.5]);

for ii=1:size(pencarian,1)
    switch pencarian.Event(ii)
        case 'startnode'
            highlight(hasil,pencarian.Node(ii),'MarkerSize',min(hasil.MarkerSize)*2);
        case 'discovernode'
            highlight(hasil,pencarian.Node(ii),'NodeColor','r');
        case 'finishnode'
            highlight(hasil,pencarian.Node(ii),'NodeColor','k');
        case 'edgetonew'
            highlight(hasil,pencarian.Edge(ii,1),pencarian.Edge(ii,2),'EdgeColor','b');
        case 'edgetodiscovered'
            highlight(hasil,pencarian.Edge(ii,1),pencarian.Edge(ii,2),'EdgeColor',[0.8 0 0.8]);
        case 'edgetofinished'
            highlight(hasil,pencarian.Edge(ii,1),pencarian.Edge(ii,2),'EdgeColor',[0 0.8 0]);
    end
    
    disp('Tekan tombol untuk proses')
    pause
end

disp('Selesai')
close all