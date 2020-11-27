function white_chess_medium_mode()
    global fig ax grid_size black white turn black_pos
    mat = zeros(grid_size+9, grid_size+9); % enlarge current grid
    mat(5:grid_size+5,5:grid_size+5) = black;
    flag = false; % stop flag to show whether computer has made the move to block user
    x_b = black_pos(1); y_b = black_pos(2);
    m = 5; % if 5 connected, then win
    check = mat(4+x_b-m+1:4+x_b+m-1, 4+y_b-m+1:4+y_b+m-1); % matrix for checking black chess score
    horizontal_sum = sum(check(:,m));
    vertical_sum = sum(check(m,:));
    diag1_sum = 0;
    diag2_sum = 0;
    for i = 1:2*m-1
        diag1_sum = diag1_sum + check(i,i);
        diag2_sum = diag2_sum + check(2*m-i,i);
    end

    [~, trail] = max([horizontal_sum vertical_sum diag1_sum diag2_sum]);
    
    for i = 1:m-1
        for j = [-1 1]
            switch trail
                case 1 % computer (w) will block the user (b) on horizontal trail
                    neighborX = x_b + i*j; neighborY = y_b;
                case 2 % computer (w) will block the user (b) on vertical trail      
                    neighborX = x_b; neighborY = y_b + i*j;
                case 3 % computer (w) will block the user (b) on diagonal trail
                    neighborX = x_b + i*j; neighborY = y_b + i*j;
                case 4 % computer (w) will block the user (b) on diagonal trail
                    neighborX = x_b + i*j; neighborY = y_b + i*j;
            end

            if (neighborX >= 1 && neighborX <= grid_size+1 ...
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
    end
    
    plot(ax, x_w, y_w, 'wo', 'MarkerFaceColor','w', 'MarkerEdgeColor','w', 'MarkerSize',15);
    win = check_winner();
    turn = mod((turn + 1),2);
    if (win)
        selection = uiconfirm(fig,'Do you want to play again?','Keep going!', ...
                        'Options',{'Restart', 'Cancel'},...
                        'DefaultOption',1);
    else 
        draw_red_cross();
    end
end