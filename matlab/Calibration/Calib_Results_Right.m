% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 968.976702087141010 ; 960.681966731359350 ];

%-- Principal point:
cc = [ 623.500000000000000 ; 467.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.988525529721307 ; 4.091527801976192 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Image size:
nx = 1248;
ny = 936;


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
omc_1 = [ -2.236462e+00 ; -2.066567e+00 ; 7.840416e-01 ];
Tc_1  = [ 1.030433e+02 ; -4.919510e+01 ; 6.218418e+02 ];
omc_error_1 = [ 4.399427e-03 ; 5.021938e-03 ; 9.628336e-03 ];
Tc_error_1  = [ 3.537088e-01 ; 2.026564e-01 ; 2.175458e+00 ];

%-- Image #2:
omc_2 = [ 2.230951e+00 ; 1.791348e+00 ; -2.458844e-01 ];
Tc_2  = [ -1.549033e+02 ; -4.171564e+01 ; 5.944186e+02 ];
omc_error_2 = [ 5.340667e-03 ; 5.113484e-03 ; 9.468249e-03 ];
Tc_error_2  = [ 1.132591e-01 ; 1.973058e-01 ; 2.553704e+00 ];

%-- Image #3:
omc_3 = [ -1.784813e+00 ; -1.915557e+00 ; 1.214366e+00 ];
Tc_3  = [ 1.559524e+02 ; -6.124306e+01 ; 7.266643e+02 ];
omc_error_3 = [ 3.418746e-03 ; 3.705554e-03 ; 4.953681e-03 ];
Tc_error_3  = [ 3.690993e-01 ; 2.350783e-01 ; 2.502752e+00 ];

%-- Image #4:
omc_4 = [ 1.583606e+00 ; 2.638497e+00 ; -4.620627e-01 ];
Tc_4  = [ 6.546527e+01 ; -7.626839e+01 ; 6.171864e+02 ];
omc_error_4 = [ 5.492951e-03 ; 6.487124e-03 ; 1.285778e-02 ];
Tc_error_4  = [ 2.607249e-01 ; 2.043601e-01 ; 2.534672e+00 ];

%-- Image #5:
omc_5 = [ 1.568961e+00 ; 2.351705e+00 ; -1.974939e-01 ];
Tc_5  = [ -1.056327e+02 ; -6.440776e+01 ; 5.957388e+02 ];
omc_error_5 = [ 4.200405e-03 ; 6.457703e-03 ; 1.160606e-02 ];
Tc_error_5  = [ 1.844859e-01 ; 1.959886e-01 ; 2.569591e+00 ];

%-- Image #6:
omc_6 = [ 2.627476e+00 ; 1.432597e+00 ; -6.267983e-01 ];
Tc_6  = [ -1.173388e+02 ; -5.846511e+00 ; 6.381496e+02 ];
omc_error_6 = [ 4.976365e-03 ; 3.260766e-03 ; 7.893165e-03 ];
Tc_error_6  = [ 2.075509e-01 ; 1.958832e-01 ; 2.555659e+00 ];

%-- Image #7:
omc_7 = [ -2.550656e+00 ; -1.521941e+00 ; 9.941711e-01 ];
Tc_7  = [ 3.744787e+01 ; -3.220685e+00 ; 6.627820e+02 ];
omc_error_7 = [ 5.023945e-03 ; 3.616342e-03 ; 7.184556e-03 ];
Tc_error_7  = [ 2.819227e-01 ; 1.998815e-01 ; 2.344640e+00 ];

%-- Image #8:
omc_8 = [ 2.623343e+00 ; 1.351758e+00 ; -4.408769e-01 ];
Tc_8  = [ -1.948138e+02 ; 5.341035e+00 ; 6.169675e+02 ];
omc_error_8 = [ 4.833368e-03 ; 3.548705e-03 ; 7.821107e-03 ];
Tc_error_8  = [ 2.147348e-01 ; 1.917200e-01 ; 2.561789e+00 ];

%-- Image #9:
omc_9 = [ 1.765653e+00 ; 1.874295e+00 ; -9.628100e-01 ];
Tc_9  = [ 1.350655e+01 ; -3.584987e+01 ; 6.391719e+02 ];
omc_error_9 = [ 2.801451e-03 ; 2.562963e-03 ; 4.048729e-03 ];
Tc_error_9  = [ 2.191425e-01 ; 2.162434e-01 ; 2.279096e+00 ];

%-- Image #10:
omc_10 = [ 1.849315e+00 ; 1.604242e+00 ; -6.242446e-01 ];
Tc_10  = [ -1.836973e+02 ; -2.683867e+01 ; 5.881843e+02 ];
omc_error_10 = [ 2.342835e-03 ; 2.666995e-03 ; 3.800458e-03 ];
Tc_error_10  = [ 1.474654e-01 ; 2.023378e-01 ; 2.345975e+00 ];

%-- Image #11:
omc_11 = [ 1.553371e+00 ; 2.179947e+00 ; -1.443649e+00 ];
Tc_11  = [ 1.217806e+02 ; -4.443488e+01 ; 6.942377e+02 ];
omc_error_11 = [ 3.032662e-03 ; 2.529610e-03 ; 3.694698e-03 ];
Tc_error_11  = [ 3.062438e-01 ; 2.338982e-01 ; 2.318302e+00 ];

%-- Image #12:
omc_12 = [ -1.013659e+00 ; -2.625171e+00 ; 1.099623e+00 ];
Tc_12  = [ 6.734069e+01 ; -5.764962e+01 ; 6.563370e+02 ];
omc_error_12 = [ 1.991843e-03 ; 3.644296e-03 ; 5.288766e-03 ];
Tc_error_12  = [ 1.963395e-01 ; 2.353877e-01 ; 2.407570e+00 ];

%-- Image #13:
omc_13 = [ 1.230494e+00 ; 2.563879e+00 ; -9.332844e-01 ];
Tc_13  = [ -1.322271e+02 ; -4.985134e+01 ; 6.272307e+02 ];
omc_error_13 = [ 2.440131e-03 ; 3.780953e-03 ; 4.622977e-03 ];
Tc_error_13  = [ 2.838715e-01 ; 2.209878e-01 ; 2.281929e+00 ];

%-- Image #14:
omc_14 = [ 2.560035e+00 ; 1.006407e+00 ; -6.909827e-01 ];
Tc_14  = [ -4.334517e+00 ; 3.543449e+01 ; 6.375633e+02 ];
omc_error_14 = [ 5.220158e-03 ; 2.329162e-03 ; 6.610451e-03 ];
Tc_error_14  = [ 2.360569e-01 ; 2.122851e-01 ; 2.573034e+00 ];

%-- Image #15:
omc_15 = [ 2.586018e+00 ; 8.458623e-01 ; -2.987747e-01 ];
Tc_15  = [ -1.841907e+02 ; 4.482479e+01 ; 5.902649e+02 ];
omc_error_15 = [ 4.810364e-03 ; 2.805544e-03 ; 6.463553e-03 ];
Tc_error_15  = [ 1.515358e-01 ; 2.097855e-01 ; 2.648025e+00 ];

%-- Image #16:
omc_16 = [ 2.414935e+00 ; 3.702436e-01 ; 6.833176e-01 ];
Tc_16  = [ -8.107502e+01 ; 5.590120e+01 ; 5.091795e+02 ];
omc_error_16 = [ 2.829998e-03 ; 1.631934e-03 ; 4.411616e-03 ];
Tc_error_16  = [ 2.411993e-01 ; 2.498265e-01 ; 2.665808e+00 ];

%-- Image #17:
omc_17 = [ 2.535088e+00 ; 5.618554e-01 ; 3.222201e-01 ];
Tc_17  = [ 5.408667e+01 ; 4.927295e+01 ; 5.204458e+02 ];
omc_error_17 = [ 2.886104e-03 ; 1.585095e-03 ; 4.718683e-03 ];
Tc_error_17  = [ 2.496835e-01 ; 2.401368e-01 ; 2.485732e+00 ];

%-- Image #18:
omc_18 = [ 2.345158e+00 ; 2.811486e-01 ; 8.202039e-01 ];
Tc_18  = [ -1.613108e+02 ; 6.091366e+01 ; 4.801696e+02 ];
omc_error_18 = [ 2.828547e-03 ; 1.639275e-03 ; 4.369971e-03 ];
Tc_error_18  = [ 3.837215e-01 ; 2.487719e-01 ; 2.548831e+00 ];

%-- Image #19:
omc_19 = [ -1.842812e+00 ; -2.004969e+00 ; 1.175604e+00 ];
Tc_19  = [ -3.474827e+01 ; -4.815484e+01 ; 6.315977e+02 ];
omc_error_19 = [ 2.398508e-03 ; 2.634405e-03 ; 3.729129e-03 ];
Tc_error_19  = [ 2.104478e-01 ; 1.905166e-01 ; 2.281697e+00 ];

%-- Image #20:
omc_20 = [ 1.920551e+00 ; 1.673954e+00 ; 1.915727e-02 ];
Tc_20  = [ -9.937404e+00 ; -5.078606e+01 ; 5.577422e+02 ];
omc_error_20 = [ 2.394547e-03 ; 2.391373e-03 ; 4.868376e-03 ];
Tc_error_20  = [ 1.692997e-01 ; 1.566200e-01 ; 2.544332e+00 ];

%-- Image #21:
omc_21 = [ 1.838468e+00 ; 1.388396e+00 ; 2.842438e-01 ];
Tc_21  = [ -1.925750e+02 ; -4.104602e+01 ; 5.038396e+02 ];
omc_error_21 = [ 2.154734e-03 ; 2.436178e-03 ; 4.440399e-03 ];
Tc_error_21  = [ 3.617091e-01 ; 1.559214e-01 ; 2.436414e+00 ];

%-- Image #22:
omc_22 = [ -1.502330e+00 ; -2.117009e+00 ; 1.162516e+00 ];
Tc_22  = [ 8.068856e+01 ; -6.412538e+01 ; 6.248326e+02 ];
omc_error_22 = [ 2.272070e-03 ; 3.108173e-03 ; 3.925143e-03 ];
Tc_error_22  = [ 2.338130e-01 ; 1.951659e-01 ; 2.158952e+00 ];

