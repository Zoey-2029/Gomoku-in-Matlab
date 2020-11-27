% FInal project for CEE201D: Computations in Civil and Environmental Engineering
% Date: Fall 2020
% Group member: Ziyue Xiao: ziyuex@stanford.edu
%               Yifan Cheng: sh1014@stanford.edu

% main file to play the gobang game
% fig: the main uifigure
% ax: axes in the figure
% grid_size: size of the chessboard, default size is 20X20
% game_mode: mode of the game, default difficulty is easy
% black, white: boolean matirx to record grids occupied by black/white chess
% black_pos: the current position of black chess position 
% prev_cross, has_previous: draw red cross to help the player identify their position in the grid
%             delete the previous cross once the palyer has moved to next
%             position, these two variables are used to trace the movement
%             of the player
% turn: whose turn to play the game

clear; clc
global fig ax grid_size black black_pos prev_cross has_previous white turn game_mode;
fig = uifigure('Name','Gobang Game'); 
grid_size = 20; 
game_mode = 1; % 1 for easy, 2 for medium, 3 for hard
fig.KeyPressFcn = @(fig, event)mark_chess_pos(event);

play_game();






