function [mesh] = calc_mesh(mesh, grid_size, error_coef, lanterns)
%% Params

n = size(lanterns,1);

mesh_width = size(mesh, 2);
mesh_height = size(mesh, 1);

%% Calc mesh

for x = 1:1:mesh_width
    for y = 1:1:mesh_height
        
        pos_x = x*grid_size;
        pos_y = y*grid_size;
        
        distances = zeros(1, n);
        
        for i = 1:1:n
            lantern_x = lanterns(i,1);
            lantern_y = lanterns(i,2);
            
            distance = sqrt((pos_x-lantern_x)^2 + (pos_y-lantern_y)^2);
            
            distances(i) = distance * error_coef;
        end
        
        [x_hat, DOP] = calc_dop(lanterns,distances);
        
        mesh(y,x) = DOP;
    end
end

end

