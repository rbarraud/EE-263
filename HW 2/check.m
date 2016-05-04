function [ valid ] = check( A, yt )
%check - checks which rows of yt are in the range of A
%   Input:
%       A  - Matrix whose range is to be checked
%       yt - vector whose entries are to be checked
%   Output:
%       valid - a vector with entry 1 at the index with broken sensor

valid = [];
for i = 1:length(yt),
    test = yt;
    test(i,:) = [];
    testA = A;
    testA(i,:) = [];
    valid = [valid ; rank([testA test]) == rank(testA)];
end
end

