% main function to play the game
function play_game()
    global grid_size black black_pos prev_cross has_previous white turn;
    % redraw and reset the chessboard and everytime the game is started 
    draw_chessboard();
    
    % set a countdown watch of 5min
    set_stopwatch(-300);
    
    black = false(grid_size+1, grid_size+1); 
    white = false(grid_size+1, grid_size+1);
    
    % black chess goes first, the default starting position is the center
    % of the grid
    turn = 0;
    black_pos = [grid_size/2+1, grid_size/2+1]; 
    has_previous = false;
    
    % draw red cross to help the player keep track of their trace
    draw_red_cross();
end