function white_chess_hard_mode()
    global fig ax grid_size black white turn black_pos
    flag = false; % flag to show whether white has made the move
    x_b = black_pos(1); y_b = black_pos(2);
    m = 5; % if 5 connected, then win
    % check current user (b) scores
    mat = zeros(grid_size+9, grid_size+9); % enlarge current grid
    mat(5:grid_size+5,5:grid_size+5) = black;
    check_b = mat(4+x_b-m+1:4+x_b+m-1, 4+y_b-m+1:4+y_b+m-1); % matrix for checking black chess score
    horizontal_sum_b = sum(check_b(:,m));
    vertical_sum_b = sum(check_b(m,:));
    diag1_sum_b = 0;
    diag2_sum_b = 0;
    for i = 1:2*m-1
        diag1_sum_b = diag1_sum_b + check_b(i,i);
        diag2_sum_b = diag2_sum_b + check_b(2*m-i,i);
    end
    
    [max_b, trail_b] = max([horizontal_sum_b vertical_sum_b diag1_sum_b diag2_sum_b]);
    
    % check current computer (w) scores
    check_w = white;
    max_horizontal = 0;
    max_vertical = 0;
    max_diag1 = 0;
    max_diag2 = 0;
    idx_horizontal = 1;
    idx_vertical = 1;
    idx_diag1 = 1;
    idx_diag2 = 1;
    horizontal_sum_w = zeros(1, grid_size+1);
    vertical_sum_w = zeros(1, grid_size+1);
    for i = 1:grid_size+1
        horizontal_sum_w(i) = sum(check_w(:,i));
        vertical_sum_w(i) = sum(check_w(i,:));
        if (horizontal_sum_w(i) > max_horizontal)
            max_horizontal = horizontal_sum_w(i);
            idx_horizontal = i;
        end
        if (vertical_sum_w(i) > max_vertical)
            max_vertical = vertical_sum_w(i);
            idx_vertical = i;
        end
    end
    diag1_sum_w = zeros(1, 2*grid_size-1);
    diag2_sum_w = zeros(1, 2*grid_size-1);
    for i = 1:2*grid_size-1
        if (i <= grid_size)
            diag1_mat = check_w(grid_size+1-i:grid_size+1, grid_size+1-i:grid_size+1);
            diag2_mat = check_w(1:1+i, grid_size+1-i:grid_size+1);
        else
            diag1_mat = check_w(1:i-grid_size+1, 1:i-grid_size+1);
            diag2_mat = check_w(1:i-grid_size+1, 2*grid_size+1-i:grid_size+1);
        end
        if (size(diag1_mat,1) >= 5)
            diag1_sum_w(i) = trace(diag1_mat);
        end
        if (size(diag2_mat,1) >= 5)
            diag2_sum_w(i) = trace(fliplr(diag2_mat));
        end
        if (diag1_sum_w(i) > max_diag1)
            max_diag1 = diag1_sum_w(i);
            idx_diag1 = i;
        end
        if (diag2_sum_w(i) > max_diag2)
            max_diag2 = diag2_sum_w(i);
            idx_diag2 = i;
        end
    end
    
    [max_w, trail_w] = max([max_horizontal max_vertical max_diag1 max_diag2]);
   
    if ((trail_w ~= trail_b) || (max_w <= max_b)) % computer (w) should defend % the same as medium mode
        choice = 1;
    elseif ((trail_w == trail_b) || (max_w > max_b)) % computer (w) should attack
        choice = 2; 
    else
        choice = 1;
    end
    
    if (choice == 1)
        for i = 1:m-1
            for j = [-1 1]
                switch trail_b
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
    end
    
    if (choice == 2)
        if (trail_w == 1)
            sum_neighbor = 0;
            max_sum_neighbor = 0;
            y = idx_horizontal;
            for x = 3:grid_size-1
                if (white(x, y) == false && black(x, y) == false && flag == false)
                    sum_neighbor = white(x-2,y) + white(x-1,y) + white(x,y) ...
                        + white(x+1,y) + white(x+2,y);
                    if(sum_neighbor > max_sum_neighbor)
                        sum_neighbor = max_sum_neighbor;
                        x_w = x; y_w = y;
                    end
                end
            end
            white(x_w, y_w) = true;
        end
        
        if (trail_w == 2)
            sum_neighbor = 0;
            max_sum_neighbor = 0;
            x = idx_vertical;
            for y = 3:grid_size-1
                if (white(x, y) == false && black(x, y) == false && flag == false)
                    sum_neighbor = white(x,y-2) + white(x,y-1) + white(x,y) ...
                        + white(x,y+1) + white(x,y+2);
                    if(sum_neighbor > max_sum_neighbor)
                        sum_neighbor = max_sum_neighbor;
                        x_w = x; y_w = y;
                    end
                end
            end
            white(x_w, y_w) = true;
        end
        
        if (trail_w == 3)
            sum_neighbor = 0;
            max_sum_neighbor = 0;
            i = idx_diag1;
            max_id = 0;
            cur_size = 0;
            if (i <= grid_size)
                diag1_mat = check_w(grid_size+1-i:grid_size+1, grid_size+1-i:grid_size+1);
                cur_size = i;
            else
                diag1_mat = check_w(1:i-grid_size+1, 1:i-grid_size+1);
                cur_size = i - grid_size;
            end
            for id = 3:cur_size
                if (diag1_mat(id, id) == false && flag == false)
                    sum_neighbor = diag1_mat(id-2,id-2) + diag1_mat(id-1,id-1) + diag1_mat(id,id) ...
                        + diag1_mat(id+1,id+1) + diag1_mat(id+2,id+2);
                    if(sum_neighbor > max_sum_neighbor)
                        sum_neighbor = max_sum_neighbor;
                        max_id = id;
                    end
                end
            end
            if (i <= grid_size)
                x_w = grid_size+1-i + cur_size - max_id;
                y_w = grid_size-i + max_id;
            else
                x_w = max_id;
                y_w = 1 + cur_size - max_id;
            end
            white(x_w, y_w) = true;
        end
        
        if (trail_w == 4)
            sum_neighbor = 0;
            max_sum_neighbor = 0;
            i = idx_diag2;
            max_id = 0;
            cur_size = 0;
            if (i <= grid_size)
                diag2_mat = check_w(1:1+i, grid_size+1-i:grid_size+1);
            else
                diag2_mat = check_w(1:i-grid_size+1, 2*grid_size+1-i:grid_size+1);
            end
            for id = 3:cur_size
                if (diag2_mat(id, id) == false && flag == false)
                    flip_mat = fliplr(diag2_mat);
                    sum_neighbor = flip_mat(id-2,id-2) + flip_mat(id-1,id-1) + flip_mat(id,id) ...
                        + flip_mat(id+1,id+1) + flip_mat(id+2,id+2);
                    if(sum_neighbor > max_sum_neighbor)
                        sum_neighbor = max_sum_neighbor;
                        max_id = id;
                    end
                end
            end
            if (i <= grid_size)
                x_w = grid_size+2-max_id;
                y_w = cur_size - max_id + 2;
            else
                x_w = cur_size - max_id + 2;
                y_w = grid_size+2-max_id;
            end
            white(x_w, y_w) = true;
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
    
    
    