# Walking Robot Examples
- Copyright 2017-2019 The MathWorks, Inc.
- src : https://github.com/mathworks-robotics/msra-walking-robot

## Introduction
This repository contains example files for the following [MATLAB and Simulink Robotics Arena](https://www.mathworks.com/academia/student-competitions/roboticsarena.html) videos on walking robots.

* [Basics of walking robots](https://www.mathworks.com/videos/model-based-control-of-humanoid-walking-1574399243682.html) https://www.youtube.com/watch?v=jnJbXdp2wak
  * `startupWalkingRobot.m` 를 실행해서 경로를 설정하고, Simscape Multibody add-on이 필요함
  * 처음부터 로봇의 움직임(관절 등등)을 모델링 하는 것이 아니고, 간단한 Linear Inverted Pendulum Model로 trajectory를 생성하고, 이것을 이용해서 로봇 관절의 움직임을 계산함
    * 간단한 Inverted Pendulum 모델을 이용해서 body (=CoM, center of mass) 의 trajectory를 만들어내고, // `applicationLIPM.mapp`
    * 이를 이용해서 양쪽 다리의 trajectory를 계산하고, // `animateLIPM.lmx`
    * Trajectory of robot을 trajectory of feet으로 변환 // `animateLIPMLocal.mlx`
    * trajectory of feet 을 trajectory of joints 로 변환 // `animateInverseKinematics.mlx`
    * 마지막으로, (6-degree of freedom leg) robot을 simulate // 
* [Modeling and simulation](https://www.mathworks.com/videos/modeling-and-simulation-of-walking-robots-1576560207573.html)
* [Trajectory optimization](https://www.mathworks.com/videos/matlab-and-simulink-robotics-arena-walking-robots-part-3-trajectory-optimization-1506440520726.html)
* [Walking pattern generation](https://www.mathworks.com/videos/matlab-and-simulink-robotics-arena-walking-robots-pattern-generation-1546434170253.html)
* [Deep reinforcement learning](https://kr.mathworks.com/videos/deep-reinforcement-learning-for-walking-robots--1551449152203.html) https://www.youtube.com/watch?v=6DL5M9b2j6I
  * state : 
    * robot doby의 위치, 회전
    * 좌/우 leg의 joint angle 및 derivative
    * F_R, F_L : indicator of the normal force on the left and right feet to tell you whether or not that foot is in contact with the ground
  * action :
    * 각각의 joint 에 가해지는 torque (= 회전력)
  * Terminating condition : 로봇이 넘어지거나, 정해진 straight line에서 너무 많이 벗어나는 경우 등...
  * reward : 아래의 조건을 결합하여 보상을 설계함
    * forward reward : 전진하는 경우 `+` 보상
    * deviation penalty : 정해진 직선에서 벗어나면 `-` 보상
    * torque penalty : 관절의 회전각이 너무 크면 `-` 보상
    * duration reward : 오랫동안 보행하면 `+` 보상
  * 본 예제에서는 DDPG (deep deterministic polidy gradient)를 사용 // `Reinforcement Learning Toolbox` 를 설치해야 함
  * `walkingRobotRL2D.slx` : 상태, 보상, 종료상태확인, 강화학습 모듈, 로봇 모듈이 포함된 시뮬링크 블록 다이어그램
  * `createDDPGNetworks.m` : actor, critic 를 위한 DNN을 생성
  * `robotParametersRL.m` : 로봇의 파라미터 설정
  * `plotTrainingResults.m` : 학습 결과 그리기 (파일을 단독으로 실행하면, 어떤 로그 파일을 읽어올지 물어보는 화면이 나옴)
  * 전체적인 실행 방법:
    * `startupWalkingRobot.m` 실행
    * `walkingRobotRL2D.slx` 파일 열기
    * `robotParametersRL.m` 파일 실행
    * `createWalkingAgent2D.m` 파일 실행
  * 기타
    * 학습 결과를 그래프로 확인 : `plotTrainingResults.m' 를 실행하고 `trainingResults_2D_mm_dd_yyyy_hhmm.mat` 파일 선택
    * 학습 결과를 시뮬레이션으로 확인 : `trainedAgent_2D_xxx.mat' 파일을 불러오고, `walkingRobotRL2D.slx` 윈도우에서 `Run` 버튼을 클릭하면 `Mechanics Exploere-walkingRobotRL2D` 화면이 나오면서, 학습된 에이전트의 움직임이 재생됨

You can also learn more about this example from our blog posts on 
[modeling and simulation](https://blogs.mathworks.com/racing-lounge/2017/10/11/walking-robot-modeling-and-simulation) 
and [control](https://blogs.mathworks.com/racing-lounge/2019/04/24/walking-robot-control/).

For any questions, email us at roboticsarena@mathworks.com.

---

## Setup
Run `startupWalkingRobot.m` to get the MATLAB path ready.

Below are the main folders containing various walking robot examples:

1.  `LIPM` -- Shows how to generate a walking pattern using the 
linear inverted pendulum model (LIPM), which is one of the foundational 
models for humanoid walking control.

2. `ModelingSimulation` -- Shows how to build the simulation of the walking 
robot, including contact forces, various actuator models, and importing from CAD.

3. `Optimization` -- Shows how to use genetic algorithms to optimize joint angle
trajectories for stability and speed.

4. `ControlDesign` -- Shows how to create closed-loop walking controllers 
using common techniques like Zero Moment Point (ZMP) manipulation and 
Model Predictive Control (MPC) for pattern generation.

5. `ReinforcementLearning` -- Shows how to set up and train a Deep Deterministic 
Policy Gradient (DDPG) reinforcement learning agent for learning how to walk.

Each of these folders has its own separate README with more information.

---

## Multiphysics Library
For convenience, a local copy of the Simscape Multibody Multiphysics Library 
has been included with this submission. If you would like to install the 
latest version of these libraries, you can find them from the Add-On Explorer, 
or on the File Exchange at https://www.mathworks.com/matlabcentral/fileexchange/37636-simscape-multibody-multiphysics-library
