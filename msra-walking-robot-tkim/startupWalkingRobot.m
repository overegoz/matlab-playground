% Walking Robot Startup Script
%
% Copyright 2017-2019 The MathWorks, Inc.

%% Clear everything
clc
clear
close all

%% Add folders to the path
addpath(genpath('LIPM'), ...                    % Linear inverted pendulum model (LIPM) files
        genpath('ModelingSimulation'), ...      % Modeling and simulation files
        genpath('Optimization'), ...            % Optimization files
        genpath('ControlDesign'), ...           % Control design files
        genpath('Libraries'));                  % Other dependencies

% Reinforcement learning files
sel = input('Select...1(RL, normal robot), 2(RL, KneeJoint), 3(FootContact): ');
if(sel == 1)
	addpath(genpath('ReinforcementLearning_Normal'));
elseif(sel == 2)
	addpath(genpath('ReinforcementLearning_KneeJoint'));
elseif(sel == 3)
	addpath(genpath('ReinforcementLearning_FootContact'));	
else
	addpath(genpath('ReinforcementLearning_Normal'));
end

%
% 경로를 지울때는 addpath 대신 rmpath 사용
%

%% Load basic robot parameters from modeling and simulation example
robotParameters

%% Open the README file
%edit README.md