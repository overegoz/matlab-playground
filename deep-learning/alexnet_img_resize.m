% Init
clear;clc;close all;

% load the original image
img = imread('imgs/img01.jpg');
% check the size : [width, height, color-depth]
imgSize = size(img);
imgSize

% load the pre-trained alexnet
net = alexnet;
% get the input size from the 1st layer (=input layer)
inputSize = net.Layers(1).InputSize;
inputSize

% resize the image
img = imresize(img, [inputSize(1), inputSize(2)]);
imgSizeNew = size(img);
imgSizeNew
%imshow(img)