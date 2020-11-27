% after we hit space, we draw the black chess
function draw_black_chess()
    global fig ax has_previous prev_cross black_pos black turn game_mode;
    delete(prev_cross);
    plot(ax, black_pos(1), black_pos(2), 'ko', 'MarkerFaceColor','k', 'MarkerEdgeColor','k', 'MarkerSize',13);
    has_previous = false;
    
    % after we place that chess, we check if we have won the game
    black(black_pos(1), black_pos(2)) = true;
    black_win = check_winner();
    
    % next round is white to play
    turn = mod(turn + 1, 2); 
    
    % if the palyer wins the game, check if he/she wants to paly again
    % else computer would place a white chess
    if (black_win)
        
        selection = uiconfirm(fig,'Congradulations! You have won the game! Do you wanna play again?','Good Job!',...
                        'Options',{'Restart', 'Cancel'},...
                        'DefaultOption',1,...
                        'CloseFcn', @(selection, event)close_confirmation_dialog(selection, event));
    elseif (game_mode == 1)
        white_chess_easy_mode();
    elseif (game_mode == 2)
        white_chess_medium_mode();
    elseif (game_mode == 3)
        white_chess_hard_mode();
    end
    
end