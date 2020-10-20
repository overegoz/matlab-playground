clear; clc; close all;

% add-on search : webcam
% install it to run

camera = webcam;

% load the pre-trained alexnet
net = alexnet;

while( 1 )
    picture = camera.snapshot;
    
    % resize the snapshot so that the pre-trained alexnet can take in
    picture = imresize(picture, [227, 227]);

    label = classify(net, picture);
    
    image(picture);
    title(char(label));
    pause(1);
end