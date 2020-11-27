%after we win or lose the game, restart the game in the confirmation dialog
function close_confirmation_dialog(selection, event)
    if (event.SelectedOptionIndex == 1)
        restart_game();
    end

end