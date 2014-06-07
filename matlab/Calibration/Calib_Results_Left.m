% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 579.480763126966050 ; 581.062801811140730 ];

%-- Principal point:
cc = [ 319.500000000000000 ; 239.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.693306389518757 ; 2.699299228092329 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 22;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 0 ; 0 ; 0 ; 0 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.240127e+00 ; -2.069501e+00 ; 6.145055e-01 ];
Tc_1  = [ 8.763228e+01 ; -1.178768e+02 ; 6.151488e+02 ];
omc_error_1 = [ 4.172901e-03 ; 4.347549e-03 ; 9.151064e-03 ];
Tc_error_1  = [ 3.213197e-01 ; 2.191038e-01 ; 2.556476e+00 ];

%-- Image #2:
omc_2 = [ 2.265360e+00 ; 1.823365e+00 ; -2.372410e-01 ];
Tc_2  = [ -1.707194e+02 ; -1.089781e+02 ; 5.869736e+02 ];
omc_error_2 = [ 4.083913e-03 ; 4.393701e-03 ; 7.318475e-03 ];
Tc_error_2  = [ 1.200152e-01 ; 2.287960e-01 ; 2.767135e+00 ];

%-- Image #3:
omc_3 = [ -1.776473e+00 ; -1.946888e+00 ; 1.096227e+00 ];
Tc_3  = [ 1.398102e+02 ; -1.387881e+02 ; 7.291765e+02 ];
omc_error_3 = [ 3.300176e-03 ; 3.343496e-03 ; 4.682433e-03 ];
Tc_error_3  = [ 3.471607e-01 ; 2.915331e-01 ; 2.744973e+00 ];

%-- Image #4:
omc_4 = [ 1.598622e+00 ; 2.670047e+00 ; -3.568256e-01 ];
Tc_4  = [ 4.939373e+01 ; -1.445551e+02 ; 6.063420e+02 ];
omc_error_4 = [ 4.356642e-03 ; 5.738975e-03 ; 1.126787e-02 ];
Tc_error_4  = [ 2.233789e-01 ; 1.950332e-01 ; 2.765594e+00 ];

%-- Image #5:
omc_5 = [ 1.576091e+00 ; 2.348216e+00 ; -1.739368e-01 ];
Tc_5  = [ -1.220581e+02 ; -1.302018e+02 ; 5.843028e+02 ];
omc_error_5 = [ 2.936833e-03 ; 5.117208e-03 ; 8.977621e-03 ];
Tc_error_5  = [ 1.645447e-01 ; 2.033068e-01 ; 2.705879e+00 ];

%-- Image #6:
omc_6 = [ 2.661335e+00 ; 1.474925e+00 ; -5.622043e-01 ];
Tc_6  = [ -1.354248e+02 ; -7.535603e+01 ; 6.255061e+02 ];
omc_error_6 = [ 4.236355e-03 ; 3.194950e-03 ; 6.756322e-03 ];
Tc_error_6  = [ 1.836659e-01 ; 2.173813e-01 ; 2.803154e+00 ];

%-- Image #7:
omc_7 = [ -2.551148e+00 ; -1.549442e+00 ; 8.853814e-01 ];
Tc_7  = [ 2.028682e+01 ; -7.483694e+01 ; 6.560544e+02 ];
omc_error_7 = [ 4.649396e-03 ; 3.089264e-03 ; 6.394092e-03 ];
Tc_error_7  = [ 2.508214e-01 ; 2.252133e-01 ; 2.599613e+00 ];

%-- Image #8:
omc_8 = [ 2.670108e+00 ; 1.381305e+00 ; -4.019373e-01 ];
Tc_8  = [ -2.110275e+02 ; -6.217409e+01 ; 6.091910e+02 ];
omc_error_8 = [ 4.022309e-03 ; 3.379274e-03 ; 6.638980e-03 ];
Tc_error_8  = [ 2.115037e-01 ; 2.062608e-01 ; 2.821538e+00 ];

%-- Image #9:
omc_9 = [ 1.799145e+00 ; 1.914668e+00 ; -8.998854e-01 ];
Tc_9  = [ -1.610695e+00 ; -1.039022e+02 ; 6.256447e+02 ];
omc_error_9 = [ 2.480152e-03 ; 2.440511e-03 ; 3.550154e-03 ];
Tc_error_9  = [ 1.920487e-01 ; 2.536791e-01 ; 2.551399e+00 ];

%-- Image #10:
omc_10 = [ 1.889685e+00 ; 1.630732e+00 ; -5.834432e-01 ];
Tc_10  = [ -2.003026e+02 ; -9.216073e+01 ; 5.779442e+02 ];
omc_error_10 = [ 2.048145e-03 ; 2.479400e-03 ; 3.376572e-03 ];
Tc_error_10  = [ 1.537132e-01 ; 2.347794e-01 ; 2.585375e+00 ];

%-- Image #11:
omc_11 = [ 1.593170e+00 ; 2.238548e+00 ; -1.350143e+00 ];
Tc_11  = [ 1.034312e+02 ; -1.167568e+02 ; 6.876254e+02 ];
omc_error_11 = [ 2.809094e-03 ; 2.561458e-03 ; 3.299154e-03 ];
Tc_error_11  = [ 2.793556e-01 ; 2.907529e-01 ; 2.590231e+00 ];

%-- Image #12:
omc_12 = [ -1.013565e+00 ; -2.655822e+00 ; 1.011072e+00 ];
Tc_12  = [ 5.121422e+01 ; -1.268687e+02 ; 6.422040e+02 ];
omc_error_12 = [ 1.890637e-03 ; 3.076250e-03 ; 4.713322e-03 ];
Tc_error_12  = [ 1.793333e-01 ; 2.705427e-01 ; 2.662027e+00 ];

%-- Image #13:
omc_13 = [ 1.253690e+00 ; 2.619886e+00 ; -8.187176e-01 ];
Tc_13  = [ -1.511701e+02 ; -1.202437e+02 ; 6.219474e+02 ];
omc_error_13 = [ 2.086630e-03 ; 3.556378e-03 ; 4.354133e-03 ];
Tc_error_13  = [ 2.965980e-01 ; 2.476881e-01 ; 2.609148e+00 ];

%-- Image #14:
omc_14 = [ 2.623215e+00 ; 1.045954e+00 ; -5.967882e-01 ];
Tc_14  = [ -2.159491e+01 ; -3.422252e+01 ; 6.322903e+02 ];
omc_error_14 = [ 4.745623e-03 ; 2.305094e-03 ; 5.990912e-03 ];
Tc_error_14  = [ 1.935872e-01 ; 1.977390e-01 ; 2.868837e+00 ];

%-- Image #15:
omc_15 = [ 2.635882e+00 ; 8.701559e-01 ; -2.636434e-01 ];
Tc_15  = [ -2.012137e+02 ; -2.243919e+01 ; 5.843006e+02 ];
omc_error_15 = [ 4.073638e-03 ; 2.658663e-03 ; 5.510975e-03 ];
Tc_error_15  = [ 1.624978e-01 ; 1.843822e-01 ; 2.883912e+00 ];

%-- Image #16:
omc_16 = [ 2.469043e+00 ; 3.507511e-01 ; 7.175885e-01 ];
Tc_16  = [ -9.531242e+01 ; -4.867696e+00 ; 4.993977e+02 ];
omc_error_16 = [ 2.560995e-03 ; 1.519432e-03 ; 4.118390e-03 ];
Tc_error_16  = [ 2.405225e-01 ; 1.720905e-01 ; 2.777805e+00 ];

%-- Image #17:
omc_17 = [ 2.581619e+00 ; 5.545610e-01 ; 3.768085e-01 ];
Tc_17  = [ 4.073010e+01 ; -1.251446e+01 ; 5.163007e+02 ];
omc_error_17 = [ 2.629026e-03 ; 1.472469e-03 ; 4.375433e-03 ];
Tc_error_17  = [ 2.193215e-01 ; 1.696056e-01 ; 2.710417e+00 ];

%-- Image #18:
omc_18 = [ 2.405519e+00 ; 2.615635e-01 ; 8.663283e-01 ];
Tc_18  = [ -1.767828e+02 ; 1.479560e+00 ; 4.800860e+02 ];
omc_error_18 = [ 2.568204e-03 ; 1.585461e-03 ; 4.213499e-03 ];
Tc_error_18  = [ 3.787569e-01 ; 1.700231e-01 ; 2.647762e+00 ];

%-- Image #19:
omc_19 = [ -1.838403e+00 ; -2.035820e+00 ; 1.067086e+00 ];
Tc_19  = [ -5.270689e+01 ; -1.166595e+02 ; 6.179495e+02 ];
omc_error_19 = [ 2.333271e-03 ; 2.319732e-03 ; 3.404197e-03 ];
Tc_error_19  = [ 2.026673e-01 ; 2.120545e-01 ; 2.482972e+00 ];

%-- Image #20:
omc_20 = [ 1.950801e+00 ; 1.674152e+00 ; 6.752937e-02 ];
Tc_20  = [ -2.468150e+01 ; -1.132641e+02 ; 5.436455e+02 ];
omc_error_20 = [ 2.064689e-03 ; 2.265882e-03 ; 4.460427e-03 ];
Tc_error_20  = [ 1.471108e-01 ; 1.572103e-01 ; 2.709144e+00 ];

%-- Image #21:
omc_21 = [ 1.891357e+00 ; 1.406568e+00 ; 3.652219e-01 ];
Tc_21  = [ -2.078975e+02 ; -1.015010e+02 ; 4.971541e+02 ];
omc_error_21 = [ 1.904937e-03 ; 2.357989e-03 ; 4.419804e-03 ];
Tc_error_21  = [ 3.613169e-01 ; 1.508137e-01 ; 2.571260e+00 ];

%-- Image #22:
omc_22 = [ -1.495931e+00 ; -2.151955e+00 ; 1.029662e+00 ];
Tc_22  = [ 6.397990e+01 ; -1.341155e+02 ; 6.176624e+02 ];
omc_error_22 = [ 2.235414e-03 ; 2.811951e-03 ; 3.717644e-03 ];
Tc_error_22  = [ 2.123650e-01 ; 2.284576e-01 ; 2.383729e+00 ];

