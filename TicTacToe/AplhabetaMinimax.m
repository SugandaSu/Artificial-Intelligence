function [nilai] = AplhabetaMinimax(Node, Depth, Alpha, Beta, Player)
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
    
    if Player == 1
        move = Move;
        move.score = -100000;
        for y= 1: 3
            for x= 1: 3
                if Node.Status(y,x) == 0
                    child = Move;
                    child.y = y;
                    child.x = x;
                    child.board = Node;
                    child.board.Status(y,x) = Player;
                    Nmove = AplhabetaMinimax(child.board, Depth, Alpha, Beta, 2);
                    if move.score < Nmove.score
                        move = Nmove;
                        move.y = y;
                        move.x = x;
                        move.score = Nmove.score;
                        move.board = child.board;
                    end
                    if Alpha < move.score
                        Alpha = move.score;
                    end
                    if Beta <= Alpha
                        break;
                    end
                end
            end
        end
        nilai = move;
        return;
    else
        move = Move;
        move.score = 100000;
        for y= 1: 3
            for x= 1: 3
                if Node.Status(y,x) == 0
                    child = Move;
                    child.y = y;
                    child.x = x;
                    child.board = Node;
                    child.board.Status(y,x) = Player;
                    Nmove = AplhabetaMinimax(child.board, Depth, Alpha, Beta, 1);
                    if move.score > Nmove.score
                        move = Nmove;
                        move.y = y;
                        move.x = x;
                        move.score = Nmove.score;
                        move.board = child.board;
                    end
                    if Beta > move.score
                        Beta = move.score;
                    end
                    if Beta <= Alpha
                        break;
                    end
                end
            end
        end
        nilai = move;
        return;
    end
end
