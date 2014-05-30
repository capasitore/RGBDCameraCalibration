%   Tao Du
%   taodu@stanford.edu
%   May 29, 2014

%   simple stereo optimization option
%   load stereo calibateion files
load_stereo_calib_files;
%   do not recompute the intrinsic parameters
recompute_intrinsic_left = 0;
recompute_intrinsic_right = 0;
%   optimization
go_calib_stereo;
%   save the resutls
saving_stereo_calib;