%constants

room_list_name = {
'101'
'104'
'105'
'106'
'427'
'502'
'503'
'504'
'505'
'506'
'LL101'
'LL210'
'ROSE'};
inter = numel(room_list);
room_list_number = [1:inter]'; %just use indexing to connect room_list_name & room_list_number

%str = 'ECE-DERP-1'
%C = textscan(str,'%s','delimiter','-');
%k = strfind(cellstr, pattern)

load spring2013.mat
