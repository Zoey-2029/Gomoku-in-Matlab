% change the size of chessboard and restart the game
function change_chessboard_size(chessboard_size_dropdown)
    global grid_size;
    
    grid_size = chessboard_size_dropdown.Value;
    play_game();
end