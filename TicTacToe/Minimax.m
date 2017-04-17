function [nilai] = Minimax(Node, Depth, Player)

    Terminal = Node.isTerminal;
    if Terminal == 1
        nilai = Move;
        nilai.score = 10 - Depth;
        return;
    elseif Terminal == 2
        nilai = Move;
        nilai.score = Depth - 10;
        return;
    elseif Terminal == 9
        nilai = Move;
        nilai.score = 0;
        return;
    end
    
    Depth = Depth + 1;
    Nmove = 1;
    
    for y= 1: 3
        for x= 1: 3
            if Node.Status(y,x) == 0
                move = Move;
                move.y = y;
                move.x = x;
                Node.Status(y,x) = Player;
                move.board = Node;
                if Player == 1
                    mm = Minimax(Node,Depth,2);
                    move.score = mm.score;
                else
                    mm = Minimax(Node,Depth,1);
                    move.score = mm.score;
                end
                Moves(Nmove) = move;
                Nmove = Nmove + 1;
                Node.Status(y,x) = 0;
            end
        end
    end
    Bmove = 0;
    if (Player == 1)
        Bscore = -10000;
        for i= 1: Nmove - 1
            if Moves(i).score > Bscore
                Bmove = i;
                Bscore = Moves(i).score;
            end
        end
    else
        Bscore = 10000;
        for i= 1: Nmove - 1
            if Moves(i).score < Bscore
                Bmove = i;
                Bscore = Moves(i).score;
            end
        end
    end
    
    nilai = Moves(Bmove);
end