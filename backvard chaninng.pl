% Rules for diagnosing diseases based on symptoms
has_disease(Patient, Disease) :-
    symptom(Patient, Symptom),
    disease(Symptom, Disease).

% Facts representing symptoms and diseases
symptom(john, fever).
symptom(john, headache).
symptom(jane, cough).
symptom(jane, sore_throat).
symptom(mary, fever).
symptom(mary, cough).

disease(fever, flu).
disease(headache, flu).
disease(cough, cold).
disease(sore_throat, cold).

% Backward Chaining
diagnose(Patient, Disease) :-
    has_disease(Patient, Disease),
    format('Patient ~w has been diagnosed with ~w.~n', [Patient, Disease]).

% Example queries:
%
% ?- diagnose(john, Disease).
% This will return "Patient john has been diagnosed with flu."

% ?- diagnose(jane, Disease).
% This will return "Patient jane has been diagnosed with cold."

% ?- diagnose(mary, Disease).
% This will return "Patient mary has been diagnosed with flu."
