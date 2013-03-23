%random initializer

population = cell(100,1);
for i = 1:100
    population{i} = randperm(182,numel(id_to_class));
end