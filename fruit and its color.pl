% Facts representing fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(kiwi, brown).
fruit_color(blueberry, blue).

% Rule to query the color of a specific fruit
fruit_color_query(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Rule to query the fruit based on color
fruit_by_color_query(Color, Fruit) :-
    fruit_color(Fruit, Color).

% Example queries:
%
% ?- fruit_color_query(apple, Color).
% This will return Color = red.

% ?- fruit_color_query(grape, Color).
% This will return Color = purple.

% ?- fruit_by_color_query(yellow, Fruit).
% This
