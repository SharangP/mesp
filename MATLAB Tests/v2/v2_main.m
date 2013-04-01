% v2_test_generate

initial_data;

sdt_vec = std_array;
room_vec = 1:13;

num_runs = 1000;
avg = zeros(num_runs,1);
gen_min = zeros(num_runs,1);


for q = 1:num_runs
    %Initial checks
    num_student = size(sdt_vec,1);
    %     num_prof = size(prof_vec,1);
    num_timeslot = size(population{1},1);
    num_room = length(room_vec);
    pop_fit = zeros(100,1);
    
    
    %Fitness Testing
    parfor h = 1:size(population,1)
        
        fitness = zeros(1,num_student);
        conflict_rating = [0 1:0.5:4];
        collision_rating = [.1 .03 .015];
        for i = 1:num_student
            sdt_timeloc = population{h}(sdt_vec(i,find(sdt_vec(i,:))));
            fitness(i) = v2_sdt_fitness(sdt_timeloc,conflict_rating,...
                collision_rating);
        end
        pop_fit(h) = sum(fitness)+ ...
            room_check(class_size,room_capacity,population{h}) + ... 
            adj_compare(population{h});
    end
    
    %plot & save
    avg(q) = mean(pop_fit);
    [top(q) test] = max(pop_fit);
    plot(avg(1:q)); %plot
    hold all
    [gen_min(q) best_loc]= min(pop_fit);
    current_best = population{best_loc};
    plot(gen_min(1:q));
    plot(top(1:q));
    drawnow
    
    pop_list = [1:100]';
    pop_ffit = [pop_fit pop_list];
    pop_ffit = sortrows(pop_ffit,1); %sort fitness numbers, keep track of order
    %Culling
    p = [100:-1:1];
    p(1) = 50000;
    p(2) = 50000;
    p(3) = 50000;
    p = p/sum(p); %generic prob vector, currently triangular
    count = randsample(100,50,true,p);
    saved = pop_ffit(count,2);
    saved_population = population(saved);
    
    %Breeding
    order_save = randperm(50,50);
    new_pop = cell(50,1);
    for i = 1:25
        [c1, c2] = v2_xbreed(saved_population{order_save(2*i)}, ...
            saved_population{order_save(2*i - 1)});
        new_pop{2*i} = c1;
        new_pop{2*i -1} = c2;
    end
    
    
    population = cat(1,saved_population,new_pop); %Combine Breeded & Survivors
    
    %Mutation
    rate = 1; %#swap mutation per
    parfor i = 1:100
        population{i} = mutate(population{i},rate);
    end
    
    
end


