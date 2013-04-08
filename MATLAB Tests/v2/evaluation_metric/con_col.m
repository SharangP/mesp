function [conflict_t, coll] = con_col(s,colr)
%s=student schedule, elements of vec = time-loc identifier
time = 14; %# of total time slots
room = 13; %# of rooms
perday = 3; %# of slots/day

ds = zeros(2,length(s));
ds(1,:) = ceil(s/time); %decomposed schedule, hardcored for now %, time
ds(2,:) = mod(s,room)+1; %location
sch = histc(ds(1,:),1:time);
conflict = sch(sch >1);
metric_1 = sum( (conflict(:))); %first metric, measure for conflict

sch_mod = [sch 0];
sch_mod = sch_mod >0;
day = sum(reshape(sch_mod,3,5),1);
day_1 = zeros(5,3); %three in a row, two, twospaced

for j = 1:5
    switch day(j)
        case 3
            day_1(j,1) = colr(1);
        case 2
            if isequal(sch(perday*j -2: perday*j),[1 0 1]) %hardcoded case
                day_1(j,3) = colr(3);
            else
                day_1(j,2) = colr(2);
            end
        otherwise
            day_1(j,:) = 0;
    end
end
coll = sum(day_1,1);
conflict_t = sum(conflict);
end



