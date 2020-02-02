function [global_dop] = global_dop(mesh)
%% Mesh params

mesh_width = size(mesh, 2);
mesh_height = size(mesh, 1);

%% Calc global DOP

global_dop = 0;

for x = 1:1:mesh_width
    for y = 1:1:mesh_height        
        
        global_dop = global_dop + mesh(y,x);
        
    end
end

end