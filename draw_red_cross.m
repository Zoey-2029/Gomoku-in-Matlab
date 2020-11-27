% draw red cross the help the player identify the position in the grid
function draw_red_cross()
    global ax has_previous black_pos prev_cross;

    % delete the previous cross to keep grid neat
    if (has_previous)
        delete(prev_cross);
    end
    
    prev_cross = plot(ax, black_pos(1), black_pos(2), 'rX', 'MarkerSize',20, 'LineWidth', 2);
    has_previous = true;
end
