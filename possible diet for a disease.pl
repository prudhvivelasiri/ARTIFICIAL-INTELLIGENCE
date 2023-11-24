% Facts representing foods and their categories
food_category(apple, fruits).
food_category(broccoli, vegetables).
food_category(chicken, protein).
food_category(fish, protein).
food_category(chocolate, sweets).
food_category(olive_oil, fats).
food_category(cake, sweets).
food_category(white_rice, carbohydrates).
food_category(spinach, vegetables).
food_category(beef, protein).

% Rules representing diet suggestions based on diseases
diet_suggestion(hypertension, [fruits, vegetables, lean_protein, whole_grains, low_fat_dairy]).
diet_suggestion(diabetes, [vegetables, lean_protein, whole_grains, healthy_fats]).
diet_suggestion(obesity, [fruits, vegetables, protein, whole_grains, low_fat_dairy, healthy_fats]).

% Rule to check if a food is suitable for a given disease
suitable_food(Food, Disease) :-
    food_category(Food, Category),
    diet_suggestion(Disease, AllowedCategories),
    member(Category, AllowedCategories).

% Rule to suggest a diet for a person with a specific disease
suggest_diet(Disease, Diet) :-
    findall(Food, suitable_food(Food, Disease), Diet).

% Example usage:
% To suggest a diet for someone with hypertension:
% ?- suggest_diet(hypertension, Diet).
