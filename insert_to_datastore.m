function [ bool_inserted ] = insert_to_datastore( path_of_datastore, path_of_image, number )
%insert_to_datastore Summary of this function goes here
%   Detailed explanation goes here
f = imread([path_of_image 'testImg.png']);
rand = randi(999999);
imwrite(f, [path_of_datastore num2str(number) '/' num2str(number) num2str(rand) '.png']);
revimg = flip(f, 2);
imwrite(revimg, [path_of_datastore num2str(number) '/' num2str(number) num2str(rand) 'r.png']);

bool_inserted = 1;

end

