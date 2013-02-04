function [fitness_num] = sdt_fitness(s)
% Fitness function for this student's schedule
%  s = student schedule
conflict_rating = [0 1:0.5:5];
conflict = s(s>=1); %keeps nonzero,
metric_1 = sum(conflict_rating(conflict(:))); %first metric, measure for conflict

s_mod = [s 0]; %augments for friday
s_mod = reshape(s_mod,3,5); %row# is timeslot relative to day, column# is day of week
s_mod = s_mod>=1; %simplification, ignores conflict

possibilities = [1 1 0; 0 1 1; 1 1 1; 1 0 1]';
met_2 = [0 0 0]';
for j = 1:5
    check = 0;
    for i = 1:4
        check = check + i*isequal(s_mod(:,j),possibilities(:,i));
    end
        switch check
        case 1
            met_2 = met_2 + [0 1 0]';
        case 2
            met_2 = met_2 + [0 1 0]';
        case 3
            met_2 = met_2 + [1 0 0]';
        case 4
            met_2 = met_2 + [0 1 0]';
        otherwise
            met_2 = [0 0 0]';
        end
end
in_a_row_rating = [.1 .05 .015];
metric_2 = in_a_row_rating*met_2;%checks for includes 3 in a day, 2 consecutive, 2 non-consecutive in one day

fitness_num = metric_1 + metric_2;
end