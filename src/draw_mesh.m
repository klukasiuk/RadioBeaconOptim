function draw_mesh(mesh, grid_size, lanterns)
%% Constants

x_scale_ticks_amount = 10;
y_scale_ticks_amount = 10;

%% Params

n = size(lanterns,1);

mesh_width = size(mesh, 2) * grid_size;
mesh_height = size(mesh, 1) * grid_size;

%% Draw Mesh

x_ticks_step = mesh_width / x_scale_ticks_amount;
y_ticks_step = mesh_height / y_scale_ticks_amount;

figure;
imagesc(mesh); 
colormap jet;
colorbar;
hold;

set(gca, 'YDir', 'normal');

xticklabels = 0:x_ticks_step:mesh_width;
xticks = linspace(1, size(mesh, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

yticklabels = mesh_height:-y_ticks_step:0;
yticks = linspace(1, size(mesh, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))

%% Draw radio lanterns positions

for i = 1:1:n
	lantern_x = lanterns(i,1);
	lantern_y = lanterns(i,2);
    
	lantern_plot_x = lantern_x / grid_size;
	lantern_plot_y = lantern_y / grid_size;
            
    plot(lantern_plot_x, lantern_plot_y, 'wd', 'MarkerSize', 10, 'MarkerFaceColor','w');
end

end

