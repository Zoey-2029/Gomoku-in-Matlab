% restart the game with default grid_size
function restart_game()
    global grid_size game_mode;
    
    grid_size = 20;
    game_mode = 1;
    play_game();
end
