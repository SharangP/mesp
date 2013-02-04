%Initial write through
%Genetic Alg. for Finals Schedule
clc;
close all;
test_generate %generate simplified test data

num_student = size(sdt_vec,1);
num_prof = size(prof_vec,1);
num_timeslot = size(population{1},1);
num_room = length(room_vec);
pop_fit = zeros(100,1);

%%
pop_fit = zeros(100,1);
for h = 1:size(population,1)
    
    sdt_sch = zeros(num_student,num_timeslot);
    for i = 1:size(sdt_vec,1)
        bool = ismember(population{h},sdt_vec(i,:));
        sdt_sch(i,:) = sum(bool,2)';
    end %output schedule for each student in a row vector
    
    prof_sch = zeros(num_prof,num_timeslot); 
    for i = 1:size(prof_vec,1)
        bool = ismember(population{h},prof_vec);
        prof_sch(i,:) = sum(bool,2)';
    end %output schedule for each prof in a row
    f_num_sdt = zeros(num_student,1);
    for i = 1:size(sdt_vec,1)
        f_num_sdt(i) = sdt_fitness(sdt_sch(i,:));
    end %fitness for each student
    
%     f_num_sdt = zeros(num_prof,1)
%     for i = 1:size(prof_vec,1)
%         f_num_prof(i) = prof_fitness(sdt_sch(i,:));
%     end %fitness for each prof
    
    pop_fit(h) = sum(sum(f_num_sdt)) ;%+ sum(sum(f_num_prof)); %simple combination both 
end

pop_list = [1:100]';
pop_ffit = [pop_fit pop_list];
pop_ffit = sortrows(pop_ffit,1);
avg = [avg mean(pop_fit)];

% randperm(450,50)
p = [100:-1:1]; p = p/sum(p); %prob vector
count = randsample(100,50,true,p);
saved = pop_ffit(count,2);

order_save = randperm(50,50);
saved_population = population(saved);
new_pop = cell(50,1);
for i = 1:25
[c1, c2] = xbreed(saved_population{order_save(2*i)},saved_population{order_save(2*i - 1)});
new_pop{2*i} = c1;
new_pop{2*i -1} = c2;
end

population = cat(1,saved_population,new_pop);