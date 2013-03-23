%Initialize data into a nice format
%Students separated row-wise

% emptyCells = cellfun('isempty', initial_student_simp);
% initial_student_simp(all(emptyCells,2),:) = []; %remove students w/o exams
% num_classes = size(id_to_class,1);
% 
% std_array = zeros(size(initial_student_simp));
% class_size = zeros(num_classes,1);


% initial_student_simp = strrep(initial_student_simp,'CE361A','CE361A/CE361B');
% initial_student_simp = strrep(initial_student_simp,'CE361B','CE361A/CE361B');
% initial_student_simp = strrep(initial_student_simp,'ECE141A','ECE141A/ECE141B');
% initial_student_simp = strrep(initial_student_simp,'ECE141B','ECE141A/ECE141B');
% initial_student_simp = strrep(initial_student_simp,'ESC120S','ESC120S/ESC121S');
% initial_student_simp = strrep(initial_student_simp,'ESC121S','ESC120S/ESC121S');
% initial_student_simp = strrep(initial_student_simp,'ESC120C','ESC120C/ESC121C');
% initial_student_simp = strrep(initial_student_simp,'ESC121C','ESC120C/ESC121C');
% initial_student_simp = strrep(initial_student_simp,'ESC120M','ESC120M/ESC121M');
% initial_student_simp = strrep(initial_student_simp,'ESC121M','ESC120M/ESC121M');
% initial_student_simp = strrep(initial_student_simp,'ME155A','ME155A/ME155B');
% initial_student_simp = strrep(initial_student_simp,'ME155B','ME155A/ME155B');
% initial_student_simp = strrep(initial_student_simp,'EID458','ME458/EID458');
% initial_student_simp = strrep(initial_student_simp,'ME458','ME458/EID458');
% initial_student_simp = strrep(initial_student_simp,'EID105','ME105/EID105');
% initial_student_simp = strrep(initial_student_simp,'ME105','ME105/EID105');
% initial_student_simp = strrep(initial_student_simp,'CH160A','CH160A/CH160B');
% initial_student_simp = strrep(initial_student_simp,'CH160B','CH160A/CH160B');
% initial_student_simp = strrep(initial_student_simp,'MA240K','MA240K/MA240S');
% initial_student_simp = strrep(initial_student_simp,'MA240S','MA240K/MA240S');
% initial_student_simp = strrep(initial_student_simp,'MA223C1','MA223C1/MA223C2');
% initial_student_simp = strrep(initial_student_simp,'MA223C2','MA223C1/MA223C2');
% initial_student_simp = strrep(initial_student_simp,'S347A','S347A/S347B');
% initial_student_simp = strrep(initial_student_simp,'S347B','S347A/S347B');

%massive hardcore fixing

%%

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
% population = cell(100,1);
% for i = 1:100
%     population{i} = randperm(182,numel(id_to_class));
% end

% id_to_class(find(class_size==0))