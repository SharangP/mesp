%v2 test generation, implementation using vectors indexed by class ID with
%time-location elements

% 14 time slots * 13 locations = 182. Let elements 1-13 denote timeslot 1, with
% rooms 1-13...

sdt_vec = zeros(400,5);
for i = 1:400
    sdt_vec(i,:) = randperm(100,5);
end %Student classes
order = randperm(100,100);
prof_vec = zeros(50,2);
for i = 1:50
    prof_vec(i,:) = [order(2*i) order(2*i-1)];
end %Professor Classes

population = cell(100,1);
sch_vec = zeros(100,1);

for i = 1:100
    population{i} = randperm(182,100);
end

room_vec = 1:13;