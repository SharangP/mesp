%Initializer
%Genetic Alg. for Finals Schedule

num_student = size(sdt_vec,1);
num_prof = size(prof_vec,1);
num_timeslot = size(population{1},1);
num_room = length(room_vec);
pop_fit = zeros(100,1);
