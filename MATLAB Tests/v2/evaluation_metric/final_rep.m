%% load result of runs
load tot_test.mat

%% for class_size
load good_import.mat
room_data;

num_classes = size(id_to_class,1);
std_array = zeros(size(initial_student_simp));
class_size = zeros(num_classes,1);

for i = 1:num_classes
    bin = strfind(initial_student_simp,id_to_class{i}); %binary
    bin = ~cellfun(@isempty,bin);
    class_size(i) = sum(sum(bin));
    std_array = std_array + i*bin;
end


%%
num_runs = numel(tot_test);
room_over = zeros(num_runs ,1);
num_student = size(std_array,1);
count = zeros(num_runs,4);
for ii = 1:num_runs
    room_over(ii) = room_conflict(class_size,room_capacity,tot_test{ii});
    for jj = 1:num_student
        sdt_timeloc = tot_test{ii}(std_array(jj,find(std_array(jj,:))));
        [fitness(jj,1), fitness(jj,2:4)] = con_col(sdt_timeloc,[1 1 1]); % con, three in a row, two, twospaced
    end
    count(ii,:) = sum(fitness,1);
    adj_count(ii) = adj_compare(tot_test{ii})/1.4;
end

final = [mean(room_over), mean(count,1), mean(adj_count); std(room_over) std(count,1) std(adj_count)];

%room_overbooked, conflict, three in a row, two in a row, 2 spaced, adj_not

%real
load parsed.mat
examslot(examslot==15) = 14;
room_s = zeros(size(room1));
for ii = 1:size(room_list)
    room_s = ii*strcmp(room1,room_list{ii}) + room_s;
end
real_sch = (examslot-1)*13 + room_s;

room_l = room_conflict(class_size,room_capacity,real_sch);
for jj = 1:num_student
    sdt_timeloc = real_sch(std_array(jj,find(std_array(jj,:))));
    [fit(jj,1) fit(jj,2:4)] = con_col(sdt_timeloc,[1 1 1]); % con, three in a row, two, twospaced
end
count_l = sum(fit,1);
adj_count_l = adj_compare(real_sch')/1.4; %too lazy to fix

real_final = [room_l count_l adj_count_l]; %<----- use later





