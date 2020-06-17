clear;clc;close all;
addpath('../src')
load('sphere_v10242.mat');
GC = GaussianCurv(F, V);
trimesh(F, V(:,1), V(:,2), V(:,3), GC);
axis equal 
colorbar