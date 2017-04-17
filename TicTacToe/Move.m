classdef Move
    properties
        x;
        y;
        score;
        board;
    end
    methods
        function position = numberGrid(obj)
            if obj.y == 1 && obj.x == 1
                position = 1;
            elseif obj.y == 1 && obj.x == 2
                position = 2;
            elseif obj.y == 1 && obj.x == 3
                position = 3;
            elseif obj.y == 2 && obj.x == 1
                position = 4;
            elseif obj.y == 2 && obj.x == 2
                position = 5;
            elseif obj.y == 2 && obj.x == 3
                position = 6;
            elseif obj.y == 3 && obj.x == 1
                position = 7;
            elseif obj.y == 3 && obj.x == 2
                position = 8;
            elseif obj.y == 3 && obj.x == 3
                position = 9;
            end
        end
    end
end