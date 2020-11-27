# Gomoku-in-Matlab
A gobang game written in Matlab

Gomoku, also called Five in a Row, is an abstract strategy board game. 
We implemented this game in Matlab.

## Usage
build the main.m file.

## GUI
<img width="597" alt="Screen Shot 2020-11-27 at 1 22 08 AM" src="https://user-images.githubusercontent.com/55666152/100433045-587bf380-304f-11eb-9ec1-72513f22d3b4.png">
Palyer plays the white chess while computer plays the black chess.

## Game mode
There are three levels of difficulty in this game 
* Easy: 
in this mode, computer tries to stop the player from winning by randomly selecting one of the eight neighbors of the previously placed white chess.
* Medium: 
computer scans the board and look for the longest sequence of white chess and block it. 
* Hard: 
now the computer will try to build a longer sequnce of black chess while defensing against the player. 
