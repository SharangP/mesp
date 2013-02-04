function [mut_org] = mutate(org,rate)
%Mutation function using swap mutations only %1 swap per gen
swp_index = randperm(numel(org),2*rate);
org(swp_index) = org(fliplr(swp_index));
mut_org = org;
end

