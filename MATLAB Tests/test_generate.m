class_list = 1:100; %give or take from last semester's final sch

sdt_vec = zeros(400,5);
for i = 1:400
    sdt_vec(i,:) = randperm(100,5);
end

order = randperm(100,100);

prof_vec = zeros(50,2);
for i = 1:50
    prof_vec(i,:) = [order(2*i) order(2*i-1)];
end

room_vec = 1:13;
% 
% room_ocp = [size, size, size ...]

population = cell(100,1);
sch_vec = [1:100 zeros(1,82)];

for i = 1:100
    pop_order = randperm(182,182);
    population{i} = reshape(sch_vec(pop_order(:)),14,13);
end
