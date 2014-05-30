%   Tao Du
%   taodu@stanford.edu
%   April 27, 2014

%   transform a point from world frame to a camera frame
%   Rc and Tc are from TOOLBOX_calib
%   the format of the input:
%   XX: a n by 3 matrix, each column represents a 3d point in the world
%   frame
%   Rc and Tc: calibration results from TOOLBOX_calib
%   XXc: a n by 3 matrix, each column represents a 3d point in the camera
%   frame
function [ XXc ] = world_to_camera( XX, Rc, Tc )
    [~, column] = size(XX);
    XXc = Rc * XX + Tc * ones(1, column);
end

