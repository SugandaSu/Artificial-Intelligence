classdef Board
    properties
        Status = [0 0 0; 0 0 0; 0 0 0;];
    end
    methods
        function terminal = isTerminal(obj)
            terminal = 0;
            for x = 1: 3
                if ((obj.Status(x,1)==1)&&(obj.Status(x,2)==1)&&(obj.Status(x,3)==1))||((obj.Status(1,x)==1)&&(obj.Status(2,x)==1)&&(obj.Status(3,x)==1))
                    terminal = 1;
                    return;
                end
                if ((obj.Status(x,1)==2)&&(obj.Status(x,2)==2)&&(obj.Status(x,3)==2))||((obj.Status(1,x)==2)&&(obj.Status(2,x)==2)&&(obj.Status(3,x)==2))
                    terminal = 2;
                    return;
                end
            end    
            if ((obj.Status(1,1)==1)&&(obj.Status(2,2)==1)&&(obj.Status(3,3)==1))||((obj.Status(1,3)==1)&&(obj.Status(2,2)==1)&&(obj.Status(3,1)==1))
                terminal = 1;
                return;
            end
            if ((obj.Status(1,1)==2)&&(obj.Status(2,2)==2)&&(obj.Status(3,3)==2))||((obj.Status(1,3)==2)&&(obj.Status(2,2)==2)&&(obj.Status(3,1)==2))
                terminal = 2;
                return;
            end
            for x = 1: 3
                for y = 1: 3
                    if obj.Status(x,y)~=0
                        terminal = terminal+ 1;
                    end
                end
            end
            if terminal ~= 9
                terminal = 0;
            end
        end
    end
end