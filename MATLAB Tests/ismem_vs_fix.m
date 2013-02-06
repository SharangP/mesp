
blank = [1:100 zeros(1,82)];
order = randperm(182,182);
sch = blank(order);
sch = reshape(sch,14,13);
s = randperm(100,5);
index = zeros(1,5);



tic
k= ismember(sch,s);
sum(k,1)
toc

tic
for i = 1:length(s)
    index(i) = find(sch==s(i)) ;
end
histc(mod(index,14),1:14 )
toc



% 
% 405.177 s
% 405.817 s

%     26
%     43
%     65
%     70
%     114