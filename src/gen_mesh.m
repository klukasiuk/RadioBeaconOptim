function [terrain_mesh] = gen_mesh(terrain_width, terrain_height,grid_size)
%% Create mesh

mesh_width = terrain_width / grid_size;
mesh_height = terrain_height / grid_size;

terrain_mesh = zeros(mesh_height,mesh_width);

end