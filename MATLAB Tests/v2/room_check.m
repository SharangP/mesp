function [validity_score] = room_check(class_size,room_capacity,member_sch)
%Checks aganist capacity of room

inter = numel(room_capacity);
member_sch = mod(member_sch,inter);
member_sch(find(mod(member_sch,inter)==0))=inter;

validity_score = 10 * sum(class_size > room_capacity(member_sch));

end

