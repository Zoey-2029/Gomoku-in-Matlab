% change the mode of game and restart
function change_game_mode(game_mode_dropdown)
    global game_mode;
    
    game_mode = game_mode_dropdown.Value;
    play_game();
end