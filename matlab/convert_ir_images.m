%   Tao Du
%   taodu@stanford.edu
%   Jun 3, 2014

function [  ] = convert_ir_images( folder_name )
    image_num = numel(dir([folder_name, '\ir_*.png']));
    %   use colormap jet
    map = colormap('jet');
    map_num = size(map, 1);

    for i = 1 : image_num
        image = imread([folder_name, '\ir_', num2str(i, '%.4d') ,'.png']);
        [h, w] = size(image);
        min_ir = double(min(min(image))); 
        max_ir = double(max(max(image)));
        %   scale all the data to 1 and num
        image = (double(image) - min_ir) * (double(map_num) - 1) ...
            /(max_ir - min_ir) + 1;
        image = reshape(round(image), h * w, 1);
        %   interpolate between 1 and num color
        color_image = map(image, :);
        color_image = reshape(color_image, h, w, 3);
        imwrite(color_image, [folder_name, 'ir_', num2str(i, '%.4d'),...
            '.bmp']);
    end
end

