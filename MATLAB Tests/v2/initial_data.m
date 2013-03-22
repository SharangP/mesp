load initial_import.mat

%Initialize data into a nice format
%Students separated row-wise

emptyCells = cellfun('isempty', initial_student_simp);
initial_student_simp(all(emptyCells,2),:) = []; %remove students w/o exams

std_array = zeros(size(initial_student_simp));

for i = 1:size(id_to_class,1)
    std_array = std_array + i*strcmp(initial_student_simp,id_to_class{i});
end

population = cell(100,1);

for i = 1:100
    population{i} = randperm(182,numel(id_to_class));
end

