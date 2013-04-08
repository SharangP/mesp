function [num_overbooked] = room_conflict(class_size,room_capacity,member_sch)
%Checks aganist capacity of room
inter = numel(room_capacity);
member_sch = mod(member_sch,inter);
member_sch(find(mod(member_sch,inter)==0))=inter;
num_overbooked = sum(class_size > room_capacity(member_sch));
end


