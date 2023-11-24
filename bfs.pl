% Define the graph with edges and their costs
edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 3).
edge(b, e, 4).
edge(c, f, 5).


% Best-First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search_aux([node(Start, [])], Goal, Path).

best_first_search_aux([node(State, Path) | _], Goal, Path) :-  % Goal reached
    State = Goal.

best_first_search_aux([node(State, Path) | Nodes], Goal, FinalPath) :-
    findall(node(Child, [State | Path]),
            (edge(State, Child, _), \+ member(Child, [State | Path])),
            Children),
    append(Children, Nodes, AllNodes),
    best_first_search_aux(AllNodes, Goal, FinalPath).

% Example query:
% Find a path from node 'a' to node 'f' using Best-First Search.
% ?- best_first_search(a, f, Path).
