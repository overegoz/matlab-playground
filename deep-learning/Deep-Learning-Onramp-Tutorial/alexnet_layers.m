% Init
clear; clc; close all;
fprintf('Initialize... done');
% load the pre-trained alexnet
deepnet = alexnet;
fprintf('Load AlexNet... done');
% load all layers
layers = deepnet.Layers;
layers
% extract 1st, input layer
inLayer = layers(1);
inLayer
% check the input size
inSize = inLayer.InputSize;
inSize
% extract last, output layer
outLayer = layers(end);
outLayer
% check the class names
categoryNames = outLayer.Classes;
categoryNames