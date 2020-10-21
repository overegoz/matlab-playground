clear;clc;close all;

ls imgs/*.jpg
net = alexnet;

imds = imageDatastore('imgs/*.jpg');

% resize the images in the data store
auds = augmentedImageDatastore([227, 227], imds);

predictions = classify(net, auds);
predictions