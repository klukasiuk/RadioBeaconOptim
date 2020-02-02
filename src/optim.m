%% Clear

clear all;
clc;

%% Constants

terrain_width = 600;
terrain_height = 600;

n = 5;

grid_size = 10;

error_coef = 1.05;

optim_iter = 100;

%% Create random lanterns

lanterns_0 = [rand(n,1)*terrain_width rand(n,1)*terrain_height];

%% Generate mesh, calc DOP, calc global DOP and draw mesh

mesh = gen_mesh(terrain_width, terrain_width, grid_size);

mesh = calc_mesh(mesh,grid_size, error_coef, lanterns_0);

DOP = global_dop(mesh)

draw_mesh(mesh, grid_size, lanterns_0);

%% Optimize Lanterns

options = optimset('Display','iter','MaxIter',optim_iter, 'PlotFcns', @optimplotfval);

fitness = @(lanterns)global_dop(calc_mesh(mesh,grid_size, error_coef, lanterns));

[opt_lanterns,opt_DOP] = fminsearchbnd(fitness, lanterns_0, zeros(n,2), [terrain_width*ones(n,1) terrain_height*ones(n,1)], options)

%% Calc optimized mesh and draw it

mesh = calc_mesh(mesh,grid_size, error_coef, opt_lanterns);

draw_mesh(mesh, grid_size, opt_lanterns);