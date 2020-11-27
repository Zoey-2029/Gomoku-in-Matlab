% keep track of the position of black chess, draw red cross or place the
% chess accroding to the keyboard event
function mark_chess_pos(event)
    global black_pos grid_size black white turn;
    
    if turn == 0
        switch event.Key
            case 'uparrow'
                black_pos=black_pos+[0,1];
                draw_red_cross();
            case 'downarrow'
                black_pos=black_pos+[0,-1];
                draw_red_cross();
            case 'leftarrow'
                black_pos=black_pos+[-1,0];
                draw_red_cross();
            case 'rightarrow'
                black_pos=black_pos+[1,0]; 
                draw_red_cross();
            case 'c'
                black_pos=[0,0];
                draw_red_cross();
            case 'space' 
                if (black_pos(1) >= 1 && black_pos(1) <= grid_size + 1 && ...
                    black_pos(2) >= 1 && black_pos(2) <= grid_size + 1 && ...
                    black(black_pos(1), black_pos(2)) == false && white(black_pos(1), black_pos(2)) == false)
                    draw_black_chess();
                end
        end
    end
end