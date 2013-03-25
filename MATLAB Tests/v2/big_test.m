total_independent_runs = 100;

collection_best = cell(total_independent_runs,1);
num_internal_runs =1200;
for ii = 1:total_independent_runs
    initial_data;
    random_init;
    collection_best{ii} = one_run(num_internal_runs,std_array,population,...
        class_size,room_capacity);
    close all;
end

