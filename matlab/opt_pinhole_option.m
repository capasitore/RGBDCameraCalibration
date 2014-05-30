%   Tao Du
%   taodu@stanford.edu
%   May 29, 2014

%   optimize a simple pinhole camera model
%   turn off some options during the calibration
center_optim = 0;
est_dist = [0; 0; 0; 0; 0];
est_alpha = 0;
cc = [(nx - 1)/2; (ny - 1)/2];