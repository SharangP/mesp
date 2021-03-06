total_independent_runs = 25;

collection_best = cell(total_independent_runs,1);
num_internal_runs =1000;
for ii = 1:total_independent_runs
    initial_data;
    random_init;
    collection_best{ii} = one_run(num_internal_runs,std_array,population,...
        class_size,room_capacity);
    close all;
    save('result4.mat','collection_best');
    disp(ii)
end

%%
collection_best = tot_test
room_data
initial_data
base = cell(13,14,100); %hardcode
% base = repmat(room_list,1,14);
% base = repmat(base,[1,1,numel(collection_best)]);

id_to_class = id_to_class'; %huh, just for easier reading

for ii = 1:numel(collection_best)
    row_index = mod(collection_best{ii},inter);
    row_index(find(row_index==0))= inter;
    col_index = ceil(collection_best{ii}./inter);
    for jj = 1:numel(id_to_class)
        [base{row_index(jj),col_index(jj),ii}] = id_to_class{jj};
    end
    
end

