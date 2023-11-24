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

% Rule to diagnose a patient based on symptoms
diagnose(Patient, Disease) :-
    symptom(Patient, Symptom),
    disease(Symptom, Disease).

% Example queries:
%
% ?- diagnose(john, Disease).
% This will return Disease = flu.

% ?- diagnose(jane, Disease).
% This will return Disease = cold.

% ?- diagnose(mary, Disease).
% This will return Disease = flu.
