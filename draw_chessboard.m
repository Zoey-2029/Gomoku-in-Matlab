% draw the chessboard
% and some lines to make it more good-looking

function draw_chessboard
    global fig ax grid_size
    ax = uiaxes('Parent',fig,...
            'Units','pixels',...
            'XTick', [],...
            'YTick', [],...
            'XLim',[0, grid_size+2],...
            'YLim', [0, grid_size+2],...
            'Color', [0.8392,0.7216,0.3804],...
            'Position', [120, 30, 330, 330]);
    hold(ax, 'on');
    
    
    [X, Y] = meshgrid(1:grid_size+1,1:grid_size+1);
    plot(ax, X, Y, 'k', Y, X, 'k');
    
    [dot_x, dot_y] = meshgrid(linspace(grid_size/2+1-6, grid_size/2+1+6, 3), linspace(grid_size/2+1-6, grid_size/2+1+6, 3));
    plot(ax,dot_x, dot_y, 'ro', 'MarkerFaceColor','k', 'MarkerEdgeColor','k', 'MarkerSize',7);
    
    
    boundary = 0.5;
    boundary_x=[1-boundary,grid_size+1+boundary,grid_size+1+boundary,1-boundary,1-boundary];
    boundary_y=[grid_size+1+boundary,grid_size+1+boundary,1-boundary,1-boundary,grid_size+1+boundary];
    plot(ax, boundary_x, boundary_y,'k');
    
    boundary=0;
    line_x = [1-boundary,grid_size+1+boundary,grid_size+1+boundary,1-boundary,1-boundary];
    line_y = [grid_size+1+boundary,grid_size+1+boundary,1-boundary,1-boundary,grid_size+1+boundary];
    plot(ax, line_x, line_y, 'k', 'LineWidth',4);
    
    draw_components();
end