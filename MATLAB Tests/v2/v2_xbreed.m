function [c1, c2] = v2_xbreed(p1, p2)
%breeding
rand_vec = randi(100,1,numel(p1))>=50;
short = find(rand_vec); %non-zero
j=1;
c1 = p1.*~rand_vec;
for i = short
    conflict = any(ismember(c1,p2(j)));
    while conflict&&p2(j)~=0
        j=j+1;
        conflict = any(ismember(c1,p2(j)));
    end
    c1(i)=p2(j);
    j=j+1;
end
c1 = (c1>0).*c1;

j=1;
c2 = p2.*~rand_vec;
for i = short
    conflict = any(ismember(c2,p1(j)));
    while conflict&&p2(j)~=0
        j=j+1;
        conflict = any(ismember(c2,p1(j)));
    end
    c2(i)=p1(j);
    j=j+1;
end
c2 = (c2>0).*c2;

end