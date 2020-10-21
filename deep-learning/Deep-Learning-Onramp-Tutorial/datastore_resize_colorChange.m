% init
clear;clc;close all;

% show the image files
ls imgs/*.jpg

% resize and save
img = imread('imgs/img01.jpg');
img = imresize(img, [227, 227]);
imwrite(img, 'imgs/img01-resize.jpg');

img = imread('imgs/img02.jpg');
img = imresize(img, [227, 227]);
imwrite(img, 'imgs/img02-resize.jpg');

img = imread('imgs/img03.jpg');
img = imresize(img, [227, 227]);
imwrite(img, 'imgs/img03-resize.jpg');

% load the pre-trained alexnet
net = alexnet;
 
% create a datastore for the images to classify
ds = imageDatastore('imgs/*-resize.jpg');
 
% get the file names of the files in the datastore
fileNames = ds.Files;
fileNames

% pick an image in the datastore
%img = readimage(ds, 2);
%imshow(img);
 
% classify the images in the datastore
predictions = classify(net, ds);

% check the classification results for the entire imgs in ds
predictions