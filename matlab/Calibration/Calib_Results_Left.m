% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 538.518013440706570 ; 539.442690108690160 ];

%-- Principal point:
cc = [ 319.500000000000000 ; 239.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.000000000000000 ; -0.000000000000000 ; -0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.539174445497847 ; 2.675644849126882 ];

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

n_ima = 19;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 0 ; 0 ; 0 ; 0 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.241862e+00 ; -2.064954e+00 ; -3.298592e-01 ];
Tc_1  = [ -1.354392e+02 ; -1.685104e+02 ; 5.454783e+02 ];
omc_error_1 = [ 7.709627e-03 ; 5.738848e-03 ; 1.387375e-02 ];
Tc_error_1  = [ 1.876395e-01 ; 3.039023e-01 ; 2.831611e+00 ];

%-- Image #2:
omc_2 = [ 1.927227e+00 ; 1.662577e+00 ; 8.347819e-01 ];
Tc_2  = [ -5.836439e+01 ; -1.852374e+02 ; 5.764288e+02 ];
omc_error_2 = [ 1.975674e-03 ; 2.254843e-03 ; 3.626704e-03 ];
Tc_error_2  = [ 1.999122e-01 ; 2.561322e-01 ; 3.260872e+00 ];

%-- Image #3:
omc_3 = [ -1.743874e+00 ; -1.734434e+00 ; 5.275524e-01 ];
Tc_3  = [ -8.582815e+01 ; -2.044464e+02 ; 7.102344e+02 ];
omc_error_3 = [ 2.409319e-03 ; 2.145735e-03 ; 3.660803e-03 ];
Tc_error_3  = [ 2.353676e-01 ; 2.315330e-01 ; 3.217960e+00 ];

%-- Image #4:
omc_4 = [ -1.678760e+00 ; -1.699999e+00 ; -8.602765e-01 ];
Tc_4  = [ -1.030000e+02 ; -1.679726e+02 ; 4.857161e+02 ];
omc_error_4 = [ 2.241489e-03 ; 2.200800e-03 ; 3.339211e-03 ];
Tc_error_4  = [ 1.221134e-01 ; 3.667170e-01 ; 2.617278e+00 ];

%-- Image #5:
omc_5 = [ -1.404527e+00 ; -1.765536e+00 ; -3.623860e-01 ];
Tc_5  = [ -1.206743e+02 ; -1.922553e+02 ; 5.545504e+02 ];
omc_error_5 = [ 1.641592e-03 ; 1.925180e-03 ; 3.370876e-03 ];
Tc_error_5  = [ 1.211814e-01 ; 2.765444e-01 ; 2.803950e+00 ];

%-- Image #6:
omc_6 = [ -1.964147e+00 ; -1.639083e+00 ; -1.216990e+00 ];
Tc_6  = [ -1.051949e+02 ; -1.270332e+02 ; 4.901782e+02 ];
omc_error_6 = [ 2.519775e-03 ; 1.966059e-03 ; 3.159727e-03 ];
Tc_error_6  = [ 1.931313e-01 ; 2.794703e-01 ; 2.753091e+00 ];

%-- Image #7:
omc_7 = [ -1.477598e+00 ; -2.307795e+00 ; 5.594087e-01 ];
Tc_7  = [ -5.856487e+01 ; -2.277012e+02 ; 7.639021e+02 ];
omc_error_7 = [ 2.725444e-03 ; 3.410487e-03 ; 4.863682e-03 ];
Tc_error_7  = [ 2.304759e-01 ; 2.879739e-01 ; 3.613540e+00 ];

%-- Image #8:
omc_8 = [ -2.157258e+00 ; -2.280257e+00 ; 2.962470e-02 ];
Tc_8  = [ -1.206122e+02 ; -1.988876e+02 ; 7.090783e+02 ];
omc_error_8 = [ 7.525450e-03 ; 6.298262e-03 ; 1.415101e-02 ];
Tc_error_8  = [ 1.255208e-01 ; 2.538723e-01 ; 3.503975e+00 ];

%-- Image #9:
omc_9 = [ 1.748780e+00 ; 1.672205e+00 ; -6.887347e-01 ];
Tc_9  = [ -1.185649e+02 ; -1.584516e+02 ; 6.129685e+02 ];
omc_error_9 = [ 1.678619e-03 ; 1.897682e-03 ; 2.472626e-03 ];
Tc_error_9  = [ 1.041187e-01 ; 2.963351e-01 ; 2.754112e+00 ];

%-- Image #10:
omc_10 = [ 1.205166e+00 ; 2.278172e+00 ; -1.061966e+00 ];
Tc_10  = [ -5.483485e+01 ; -2.077374e+02 ; 6.876996e+02 ];
omc_error_10 = [ 1.721466e-03 ; 2.047837e-03 ; 2.556469e-03 ];
Tc_error_10  = [ 1.693076e-01 ; 3.936473e-01 ; 2.959258e+00 ];

%-- Image #11:
omc_11 = [ 2.012773e+00 ; 1.164251e+00 ; -4.020420e-01 ];
Tc_11  = [ -1.108014e+02 ; -1.516987e+02 ; 6.018075e+02 ];
omc_error_11 = [ 1.779259e-03 ; 1.731772e-03 ; 2.359977e-03 ];
Tc_error_11  = [ 7.228595e-02 ; 3.081201e-01 ; 2.942060e+00 ];

%-- Image #12:
omc_12 = [ 2.085051e+00 ; 6.270820e-01 ; -3.651573e-01 ];
Tc_12  = [ -1.118020e+02 ; -1.057061e+02 ; 5.924240e+02 ];
omc_error_12 = [ 1.762550e-03 ; 1.496420e-03 ; 2.067096e-03 ];
Tc_error_12  = [ 8.425489e-02 ; 2.721887e-01 ; 3.025884e+00 ];

%-- Image #13:
omc_13 = [ 2.172096e+00 ; 1.520122e+00 ; 2.646554e-01 ];
Tc_13  = [ -1.033156e+02 ; -1.602716e+02 ; 5.933887e+02 ];
omc_error_13 = [ 2.230453e-03 ; 2.303876e-03 ; 4.898148e-03 ];
Tc_error_13  = [ 1.658870e-01 ; 2.171295e-01 ; 3.128131e+00 ];

%-- Image #14:
omc_14 = [ -1.725114e+00 ; -2.489496e+00 ; 6.048006e-01 ];
Tc_14  = [ -9.387439e+01 ; -2.126966e+02 ; 6.749454e+02 ];
omc_error_14 = [ 2.766805e-03 ; 2.880276e-03 ; 5.187345e-03 ];
Tc_error_14  = [ 2.021160e-01 ; 3.107564e-01 ; 3.111725e+00 ];

%-- Image #15:
omc_15 = [ -1.028100e+00 ; -2.352160e+00 ; 9.930711e-01 ];
Tc_15  = [ -4.792286e+01 ; -2.260223e+02 ; 7.978821e+02 ];
omc_error_15 = [ 1.764041e-03 ; 2.375670e-03 ; 3.177279e-03 ];
Tc_error_15  = [ 2.348784e-01 ; 3.415289e-01 ; 3.697203e+00 ];

%-- Image #16:
omc_16 = [ 2.179111e+00 ; 1.120676e+00 ; 4.355067e-01 ];
Tc_16  = [ -8.011485e+01 ; -1.410354e+02 ; 6.662694e+02 ];
omc_error_16 = [ 2.157746e-03 ; 1.897349e-03 ; 3.916144e-03 ];
Tc_error_16  = [ 1.844699e-01 ; 2.434548e-01 ; 3.668557e+00 ];

%-- Image #17:
omc_17 = [ 9.903161e-01 ; 2.198352e+00 ; -1.197080e+00 ];
Tc_17  = [ -4.743374e+01 ; -1.562219e+02 ; 7.859049e+02 ];
omc_error_17 = [ 1.876050e-03 ; 2.047648e-03 ; 2.470945e-03 ];
Tc_error_17  = [ 1.953713e-01 ; 3.500359e-01 ; 3.383146e+00 ];

%-- Image #18:
omc_18 = [ 2.002534e+00 ; 8.647357e-01 ; -5.305439e-01 ];
Tc_18  = [ -1.273844e+02 ; -1.113063e+02 ; 7.170387e+02 ];
omc_error_18 = [ 1.888395e-03 ; 1.860622e-03 ; 2.456186e-03 ];
Tc_error_18  = [ 8.655083e-02 ; 3.046974e-01 ; 3.584649e+00 ];

%-- Image #19:
omc_19 = [ 3.407926e-02 ; 2.695741e+00 ; -1.420068e+00 ];
Tc_19  = [ 4.567095e+01 ; -1.461813e+02 ; 7.714345e+02 ];
omc_error_19 = [ 1.784198e-03 ; 2.179263e-03 ; 2.795293e-03 ];
Tc_error_19  = [ 1.590236e-01 ; 3.503065e-01 ; 3.345407e+00 ];

