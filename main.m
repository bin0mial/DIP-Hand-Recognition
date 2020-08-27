function main(image_name, darkbackground, retrainDataset, saveToDataset, currentNumber)

datastore_path = 'machine_learn_datastore/';
image_test_store_path = 'image_test/';
captured_images_path = 'image_captured/';

% read image gui
filename = [captured_images_path image_name];


% read the processing image
f = imread(filename);

% change image to gray level
grayf = rgb2gray(rgb2ycbcr(f));

% resize current image to 128x128
resf = imresize(grayf, [128 128]);

% sharping image to improve separation
f2 = imsharpen(resf, 'Radius',1,'Amount',1);

% check if current background dark or light nessesary for separation
if ~darkbackground
    f2 = imcomplement(f2);
end

% image separation threshold
imthresh = graythresh(f2);

% separate image
segimg = imfill(( f2 > imthresh*(255) & (f2<220)), 'holes');

% edge detection
fedge = edge(segimg, 'Sobel');

% improving image by dilation then erosion to remove black dots if exist
se = strel('disk', 4);
immorph = imclose(segimg, se);

% save image-
imwrite(segimg, [image_test_store_path 'testImg.png']);

% insert new image to datastore (for improving image recognition)
if saveToDataset
    insert_to_datastore( datastore_path, image_test_store_path, currentNumber);
end

% apply machine learning for recognition
machine_learning( datastore_path, image_test_store_path, retrainDataset);

%show modified data
show_images( f, segimg, fedge, immorph )