% computer ouwld look at the grid and place the chess
% this is the middium mode
function white_chess_easy_mode()
    global fig ax grid_size black white turn black_pos
    flag = false; % flag to check whether white has made the move
    x_b = black_pos(1); y_b = black_pos(2);
    for i = 1:8
        neighborX = x_b + randperm(3,1)-2;
        neighborY = y_b + randperm(3,1)-2;
        if (neighborX >=1 && neighborX <= grid_size+1 ...
                && neighborY >= 1 && neighborY <= grid_size+1 ...
                && black(neighborX, neighborY) == false ...
                && white(neighborX, neighborY) == false && flag == false)
            x_w = neighborX;
            y_w = neighborY;
            white(x_w, y_w) = true;
            flag = true;
            break;
        end
    end
    
    % place the chess and check if computer has won the game
    % if not, the player would continue
    white(x_w, y_w) = true;
    plot(ax, x_w, y_w, 'wo', 'MarkerFaceColor','w', 'MarkerEdgeColor','w', 'MarkerSize',13);
    win = check_winner();
    turn = mod((turn + 1),2);
    if (win)
        selection = uiconfirm(fig,'I am sorry, do you want to paly again?','Keep going!', ...
                        'Options',{'Restart', 'Cancel'},...
                        'DefaultOption',1,...
                        'CloseFcn', @(selection, event)close_confirmation_dialog(selection, event));
    else 
        draw_red_cross();
    end
end