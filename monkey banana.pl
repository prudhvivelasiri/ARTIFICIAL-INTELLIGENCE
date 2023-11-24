% Initial state: monkey is at the door, box is in the middle of the room, banana is hanging from the ceiling.
at(door, monkey).
at(middle, box).
at(ceiling, banana).

% Actions to perform
action(walk_to_middle).
action(push_box).
action(climb_box).
action(pick_up_banana).

% Define the goal state
goal_state([at(middle, monkey), at(middle, box), at(ceiling, banana)]).

% Apply an action to the current state
apply_action(State, Action, NewState) :-
    call(Action),
    NewState =.. [Action, State].

% Check if the goal state is reached
goal_reached(State) :-
    goal_state(GoalState),
    State = GoalState.

% Execute a sequence of actions to reach the goal state
execute_actions(State, [], State).
execute_actions(State, [Action | Rest], FinalState) :-
    apply_action(State, Action, NewState),
    execute_actions(NewState, Rest, FinalState).

% Solve the Monkey Banana Problem
solve_problem(Plan) :-
    initial_state(InitialState),
    goal_state(GoalState),
    solve(InitialState, GoalState, Plan).

% Base case: goal is already reached
solve(State, Goal, []) :-
    goal_reached(State, Goal).

% Recursive case: find a sequence of actions to reach the goal state
solve(State, Goal, [Action | Rest]) :-
    action(Action),
    apply_action(State, Action, NewState),
    solve(NewState, Goal, Rest).

% Example query:
% To solve the Monkey Banana Problem, you can run:
% ?- solve_problem(Plan).
