function [fit_num] = v2_sdt_fitness(s,conr,colr)
%s=student schedule, elements of vec = time-loc identifier
time = 14; %# of total time slots
room = 13; %# of rooms
perday = 3; %# of slots/day

ds = zeros(2,length(s));
ds(1,:) = ceil(s/room); %decomposed schedule, hardcored for now %, time
ds(2,:) = mod(s,room)+1; %location , not used/also entirely correct
sch = histc(ds(1,:),1:time);
conflict = sch(sch >=1);
metric_1 = sum(conr(conflict(:))); %first metric, measure for conflict

sch_mod = [sch 0];
sch_mod = sch_mod >0;
day = sum(reshape(sch_mod,3,5),1);
day_1 = zeros(5,1);
for j = 1:5
    switch day(j)
        case 3
            day_1(j) = colr(1);
        case 2
            if isequal(sch_mod(perday*j -2: perday*j),[1 0 1]) %hardcoded case
                day_1(j) = colr(3);
            else
                day_1(j) = colr(2);
            end
        otherwise
            day_1(j) = 0;
    end
end

metric_2 = sum(day_1); 

fit_num = metric_1 + metric_2;

end

