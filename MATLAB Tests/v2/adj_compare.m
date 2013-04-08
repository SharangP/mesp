%hardcode adjuncts??? huh
function [num] = adj_compare(sch)

load class_adj.mat;
sch = ceil(sch/13); %hardcoded 13
sch = sch';

num_get = sum(sch == class_adj2);
num_want = numel(find(class_adj2));

num = 1.4*(num_want - num_get);
end
