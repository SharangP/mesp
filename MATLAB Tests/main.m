clear all;
clc;
close all;
test_generate %generate simplified test data
initializer

%Generational fitness track 
num_runs = 10000;
avg = zeros(num_runs,1);
gen_min = zeros(num_runs,1);
for q = 1:num_runs
    
    %Fitness Testing
    pop_fit = zeros(100,1);
   parfor h = 1:size(population,1)
        
        sdt_sch = zeros(num_student,num_timeslot);
        for i = 1:size(sdt_vec,1)
            bool = ismember(population{h},sdt_vec(i,:));
            sdt_sch(i,:) = sum(bool,2)';
        end %output schedule for each student in a row vector
        
%         prof_sch = zeros(num_prof,num_timeslot);
%         for i = 1:size(prof_vec,1)
%             bool = ismember(population{h},prof_vec);
%             prof_sch(i,:) = sum(bool,2)';
%         end %output schedule for each prof in a row

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
    pop_ffit = sortrows(pop_ffit,1); %sort fitness numbers, keep track of order
    
    avg(q) = mean(pop_fit);
    
    %Culling
    p = [100:-1:1]; 
    p(1) = 5000;
    p(2) = 5000;
    p = p/sum(p); %generic prob vector, currently triangular
    count = randsample(100,50,true,p);
    saved = pop_ffit(count,2);
    saved_population = population(saved);
    
    %Breeding
    order_save = randperm(50,50);
    new_pop = cell(50,1);
    for i = 1:25
        [c1, c2] = xbreed(saved_population{order_save(2*i)},saved_population{order_save(2*i - 1)});
        new_pop{2*i} = c1;
        new_pop{2*i -1} = c2;
    end
    
    population = cat(1,saved_population,new_pop); %Combine Breeded & Survivors
    
    %Mutation
    rate = 1; %#swap mutation per
    parfor i = 1:100
        population{i} = mutate(population{i},rate);
    end
    
    plot(avg(1:q)); %plot
    hold all
    gen_min(q) = min(pop_fit);
    plot(gen_min(1:q));
    drawnow
end
