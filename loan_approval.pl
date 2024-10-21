% Facts about the applicant
applicant(john).
age(john, 30).
income(john, 50000).
credit_score(john, 720).
employment_status(john, employed).
existing_debt(john, 10000).

% Loan criteria rules
% Rule 1: Applicant must be at least 18 years old
age_criteria(X) :- age(X, Age), Age >= 18.

% Rule 2: Minimum income requirement
income_criteria(X) :- income(X, Income), Income >= 30000.

% Rule 3: Good credit score (above 650)
credit_score_criteria(X) :- credit_score(X, Score), Score > 650.

% Rule 4: Applicant must be employed
employment_criteria(X) :- employment_status(X, employed).

% Rule 5: Debt-to-income ratio should be below 40%
debt_to_income_criteria(X) :- 
    income(X, Income), 
    existing_debt(X, Debt), 
    Ratio is (Debt / Income) * 100,
    Ratio < 40.

% Final loan approval rule
loan_approval(X) :-
    age_criteria(X),
    income_criteria(X),
    credit_score_criteria(X),
    employment_criteria(X),
    debt_to_income_criteria(X).
