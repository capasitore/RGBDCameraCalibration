%   Tao Du
%   taodu@stanford.edu
%   May 29, 2014

%   test the calibration results
%   run this function from the folder
%   that contains the test images
%   the color images for PrimeSense should be either color_0001.bmp
%   or ir_0001.bmp

%   input image_prefix: 'color' or 'ir'
function [ ] = test_stereo( image_prefix )
%   load stereo calibration results
load('../Calibration/Calib_Results_stereo.mat');
%   get the number of scenes
num = numel(dir('*.png'));
for i = 1 : num
    %   load color image from the PrimeSense
    image1 = imread([image_prefix, '_', num2str(i, '%.4d'), '.bmp']);
    %   load color image from the DSLR
    image2 = imread(['color_', num2str(i, '%.4d'), '.jpg']);
    %   load the depth image
    depth = double(imread(['depth_', num2str(i, '%.4d'), '.png']));
    %   show image1
    figure;imshow(image1);
    %   pick some feature points you want
    pixels = ginput();
    %   get the number of the feature point
    pixel_num = size(pixels, 1);
    for p = 1 : pixel_num
        %   draw crosses on image1
        px = round(pixels(p, 1));
        py = round(pixels(p, 2));
        image1 = draw_cross(image1, px, py);
        %   get the depth
        d = depth(py, px);
        %   transform to camera coordinate
        XL = pixel_to_camera(pixels(p, :)' - 1, d, ...
            fc_left, cc_left, kc_left, alpha_c_left);
        %   transform between camera coordinates
        XR = R * XL + T;
        %   project to image2
        pr = camera_to_pixel(XR, kc_right, KK_right);
        %   draw crosses on image2
        image2 = draw_cross(image2, round(pr(1)) + 1, round(pr(2)) + 1);
    end
    imshow(image1);
    figure; imshow(image2);
end
end