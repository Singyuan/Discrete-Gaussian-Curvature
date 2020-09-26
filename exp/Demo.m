%% Demo
%  Demo
%
%  Syntax
%
%  Descriptions
%  The data sphere_v10242.mat or sphere_v4.mat can be chosen. The number
%  next to v means the number of vertex parametrize of the sphere. That is,
%  sphere_v4.mat is a tetrahedron.
%%
clear;clc;close all;
addpath('../src')
load('sphere_v10242.mat');
Kcurv = GaussianCurv(F, V);
trimesh(F, V(:, 1), V(:, 2), V(:, 3), Kcurv);
axis equal 
colorbar