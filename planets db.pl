% Facts representing planets and their properties
planet(mercury, rocky, 36).
planet(venus, rocky, 67).
planet(earth, rocky, 93).
planet(mars, rocky, 142).
planet(jupiter, gas_giant, 484).
planet(saturn, gas_giant, 886).
planet(uranus, ice_giant, 1782).
planet(neptune, ice_giant, 2793).

% Rule to find planets of a certain type
planets_of_type(Type, Planets) :-
    findall(Planet, planet(Planet, Type, _), Planets).

% Rule to find planets within a certain distance range from the sun
planets_within_distance(MinDistance, MaxDistance, Planets) :-
    findall(Planet, (planet(Planet, _, Distance), Distance >= MinDistance, Distance =< MaxDistance), Planets).

% Example queries:
%
% ?- planets_of_type(rocky, RockyPlanets).
% This will return RockyPlanets = [mercury, venus, earth, mars].

% ?- planets_within_distance(100, 1000, PlanetsInRange).
% This will return PlanetsInRange = [mercury, venus, earth, mars, jupiter, saturn].

% Feel free to add more facts or rules to expand the database and queries.
