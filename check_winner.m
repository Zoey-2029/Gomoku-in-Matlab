% check if white or black has won the game
% used the idea of dynamic programming to simplify time complexity

function win = check_winner()
    global white grid_size black turn;
    win = false;
    
    grid = black; 
    if (turn == 1) 
        grid = white;
    end
   
    horizontal = zeros(grid_size+1, grid_size+1);
    vertical = zeros(grid_size+1, grid_size+1);
    diag_1 = zeros(grid_size+1, grid_size+1);
    diag_2 = zeros(grid_size+1, grid_size+1);
    
    
    for x = 1:grid_size+1
        for y = 1:grid_size+1
            if grid(x,y) == 1
                horizontal(x, y) = 1;
                vertical(x, y) = 1;
                diag_1(x, y) = 1;
                diag_2(x, y) = 1;
                
                if (x > 1)
                    vertical(x, y) = vertical(x, y) +  vertical(x-1, y);
                end
                
                if (y > 1)
                    horizontal(x, y) = horizontal(x, y) + horizontal(x, y - 1);
                end
                
                if (x > 1 && y > 1)
                    diag_1(x, y) = diag_1(x, y) + diag_1(x - 1, y - 1);
                end
                
                if (x > 1 && y < grid_size + 1)
                    diag_2(x, y) = diag_2(x, y) + diag_2(x - 1, y + 1);
                end
                
                % once we found consequent line of chess with length over
                % 5, then one side has won the game
                if (horizontal(x, y) == 5 || vertical(x, y) == 5 || diag_1(x, y) == 5 || diag_2(x, y) == 5)
                    win = true;
                    return;
                end
            end 
        end
    end
end