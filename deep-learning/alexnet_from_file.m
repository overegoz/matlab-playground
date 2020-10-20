clear;clc;close all;

% Add-on search : Deep Learning Toolbox Model for AlexNet Network
% download it to use the pre-trained model

% load the alexnet pre-trained model
net = alexnet;

% read an image
img1 = imread('imgs/img01.jpg');

% display the image
%imshow(img1);

% resize to [227, 227] so that the pre-trained alexnet can take in
img1 = imresize(img1, [227, 227]);

% predict!
pred1 = classify(net, img1)