% Define the Hanoi predicate
hanoi(N) :-
    move(N, left, center, right).

% Base case: Moving 0 disks requires no action
move(0, _, _, _) :- !.

% Recursive case for moving N disks
move(N, A, B, C) :-
    N > 0,
    M is N - 1,
    move(M, A, C, B),
    format('Move disk ~w from ~w to ~w~n', [N, A, C]),
    move(M, B, A, C).

% Example usage:
% To solve the Towers of Hanoi problem for 3 disks, you can run:
% ?- hanoi(3).
