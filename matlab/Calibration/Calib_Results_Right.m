% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 11671.321999211075000 ; 11664.096499244028000 ];

%-- Principal point:
cc = [ 2463.500000000000000 ; 1631.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.000000000000000 ; -0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 24.615986377470509 ; 25.226768691136922 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ; 0.000000000000000 ];

%-- Image size:
nx = 4928;
ny = 3264;


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
omc_1 = [ -2.320343e+00 ; -2.090431e+00 ; -2.890765e-01 ];
Tc_1  = [ -1.259252e+02 ; -5.528816e+01 ; 6.199720e+02 ];
omc_error_1 = [ 2.825125e-03 ; 2.409416e-03 ; 4.872106e-03 ];
Tc_error_1  = [ 8.806628e-02 ; 6.886536e-02 ; 1.422492e+00 ];

%-- Image #2:
omc_2 = [ 1.892510e+00 ; 1.634365e+00 ; 7.718509e-01 ];
Tc_2  = [ -4.969322e+01 ; -7.211563e+01 ; 6.539857e+02 ];
omc_error_2 = [ 8.580010e-04 ; 8.519121e-04 ; 1.393772e-03 ];
Tc_error_2  = [ 8.069950e-02 ; 5.803158e-02 ; 1.622086e+00 ];

%-- Image #3:
omc_3 = [ -1.808026e+00 ; -1.717136e+00 ; 5.625058e-01 ];
Tc_3  = [ -7.896469e+01 ; -8.255831e+01 ; 7.888292e+02 ];
omc_error_3 = [ 9.014600e-04 ; 9.534880e-04 ; 1.610065e-03 ];
Tc_error_3  = [ 9.260431e-02 ; 5.471149e-02 ; 1.588754e+00 ];

%-- Image #4:
omc_4 = [ -1.739564e+00 ; -1.731555e+00 ; -8.322144e-01 ];
Tc_4  = [ -9.312374e+01 ; -6.117535e+01 ; 5.630257e+02 ];
omc_error_4 = [ 7.964454e-04 ; 8.308839e-04 ; 1.167607e-03 ];
Tc_error_4  = [ 5.047385e-02 ; 7.865474e-02 ; 1.316652e+00 ];

%-- Image #5:
omc_5 = [ -1.466705e+00 ; -1.779806e+00 ; -3.337599e-01 ];
Tc_5  = [ -1.116734e+02 ; -8.025864e+01 ; 6.311664e+02 ];
omc_error_5 = [ 5.868829e-04 ; 7.792836e-04 ; 1.300900e-03 ];
Tc_error_5  = [ 4.594427e-02 ; 6.783701e-02 ; 1.395917e+00 ];

%-- Image #6:
omc_6 = [ -2.022454e+00 ; -1.681252e+00 ; -1.198016e+00 ];
Tc_6  = [ -9.418763e+01 ; -1.974667e+01 ; 5.647239e+02 ];
omc_error_6 = [ 9.303188e-04 ; 7.659665e-04 ; 1.120240e-03 ];
Tc_error_6  = [ 7.247865e-02 ; 6.399890e-02 ; 1.377428e+00 ];

%-- Image #7:
omc_7 = [ -1.536274e+00 ; -2.295964e+00 ; 6.135083e-01 ];
Tc_7  = [ -5.255887e+01 ; -1.046851e+02 ; 8.445065e+02 ];
omc_error_7 = [ 1.116648e-03 ; 1.692772e-03 ; 2.221812e-03 ];
Tc_error_7  = [ 9.224697e-02 ; 6.550673e-02 ; 1.746518e+00 ];

%-- Image #8:
omc_8 = [ 2.153126e+00 ; 2.220038e+00 ; -7.264958e-02 ];
Tc_8  = [ -1.131950e+02 ; -7.746035e+01 ; 7.858380e+02 ];
omc_error_8 = [ 4.066965e-03 ; 4.375705e-03 ; 8.756497e-03 ];
Tc_error_8  = [ 4.629461e-02 ; 5.543337e-02 ; 1.766636e+00 ];

%-- Image #9:
omc_9 = [ 1.728270e+00 ; 1.609898e+00 ; -7.298456e-01 ];
Tc_9  = [ -1.093795e+02 ; -4.303365e+01 ; 6.883039e+02 ];
omc_error_9 = [ 7.270389e-04 ; 7.953139e-04 ; 1.115871e-03 ];
Tc_error_9  = [ 4.140529e-02 ; 7.090589e-02 ; 1.365868e+00 ];

%-- Image #10:
omc_10 = [ 1.212581e+00 ; 2.212608e+00 ; -1.118136e+00 ];
Tc_10  = [ -4.768348e+01 ; -8.934846e+01 ; 7.672159e+02 ];
omc_error_10 = [ 7.447549e-04 ; 8.725838e-04 ; 1.115592e-03 ];
Tc_error_10  = [ 6.860373e-02 ; 9.675277e-02 ; 1.450665e+00 ];

%-- Image #11:
omc_11 = [ 1.976540e+00 ; 1.111342e+00 ; -4.297135e-01 ];
Tc_11  = [ -1.012495e+02 ; -3.763454e+01 ; 6.774610e+02 ];
omc_error_11 = [ 7.519528e-04 ; 7.049431e-04 ; 1.076405e-03 ];
Tc_error_11  = [ 3.053224e-02 ; 6.935715e-02 ; 1.465071e+00 ];

%-- Image #12:
omc_12 = [ 2.037337e+00 ; 5.789113e-01 ; -3.785172e-01 ];
Tc_12  = [ -1.011272e+02 ; 7.872531e+00 ; 6.645879e+02 ];
omc_error_12 = [ 7.172542e-04 ; 5.966618e-04 ; 9.277317e-04 ];
Tc_error_12  = [ 3.458449e-02 ; 6.738522e-02 ; 1.510425e+00 ];

%-- Image #13:
omc_13 = [ 2.134309e+00 ; 1.473936e+00 ; 2.223303e-01 ];
Tc_13  = [ -9.369211e+01 ; -4.629264e+01 ; 6.678360e+02 ];
omc_error_13 = [ 1.023240e-03 ; 9.169132e-04 ; 2.213130e-03 ];
Tc_error_13  = [ 7.581353e-02 ; 5.622273e-02 ; 1.555108e+00 ];

%-- Image #14:
omc_14 = [ -1.778878e+00 ; -2.479294e+00 ; 6.720243e-01 ];
Tc_14  = [ -8.648506e+01 ; -9.414784e+01 ; 7.538360e+02 ];
omc_error_14 = [ 1.242675e-03 ; 1.631970e-03 ; 2.602102e-03 ];
Tc_error_14  = [ 8.305798e-02 ; 8.033805e-02 ; 1.510286e+00 ];

%-- Image #15:
omc_15 = [ -1.082827e+00 ; -2.326254e+00 ; 1.055291e+00 ];
Tc_15  = [ -4.180116e+01 ; -1.011002e+02 ; 8.784726e+02 ];
omc_error_15 = [ 6.984633e-04 ; 1.099913e-03 ; 1.347055e-03 ];
Tc_error_15  = [ 9.332967e-02 ; 7.816128e-02 ; 1.764087e+00 ];

%-- Image #16:
omc_16 = [ 2.131071e+00 ; 1.086504e+00 ; 3.995503e-01 ];
Tc_16  = [ -7.045399e+01 ; -2.315537e+01 ; 7.397714e+02 ];
omc_error_16 = [ 9.144162e-04 ; 7.457044e-04 ; 1.668391e-03 ];
Tc_error_16  = [ 7.672137e-02 ; 7.065206e-02 ; 1.780338e+00 ];

%-- Image #17:
omc_17 = [ 9.961173e-01 ; 2.136404e+00 ; -1.254664e+00 ];
Tc_17  = [ -3.936382e+01 ; -3.218193e+01 ; 8.617631e+02 ];
omc_error_17 = [ 7.781234e-04 ; 8.647603e-04 ; 1.069127e-03 ];
Tc_error_17  = [ 7.754953e-02 ; 8.428026e-02 ; 1.637327e+00 ];

%-- Image #18:
omc_18 = [ 1.960897e+00 ; 8.118923e-01 ; -5.509419e-01 ];
Tc_18  = [ -1.175464e+02 ; 1.025840e+01 ; 7.899583e+02 ];
omc_error_18 = [ 7.889587e-04 ; 7.356885e-04 ; 1.066300e-03 ];
Tc_error_18  = [ 3.433324e-02 ; 7.870935e-02 ; 1.753180e+00 ];

%-- Image #19:
omc_19 = [ 6.693969e-02 ; 2.652065e+00 ; -1.500462e+00 ];
Tc_19  = [ 5.433609e+01 ; -2.502946e+01 ; 8.476104e+02 ];
omc_error_19 = [ 7.352248e-04 ; 9.691430e-04 ; 1.189077e-03 ];
Tc_error_19  = [ 6.412573e-02 ; 8.228254e-02 ; 1.622573e+00 ];

