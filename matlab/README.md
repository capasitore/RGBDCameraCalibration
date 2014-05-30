## RGBDCameraCalibration - matlab part ##

### prepare your images ###

You should have three kinds of images: depth images from PrimeSense, color images from PrimeSense, and color images from your external DSLR cameras. Put all of them in the folder /matlab/calibration. We have provided 57 sample images for your reference. 'depth_XXXX.png' is the depth image from PrimeSense, 'color_XXXX.bmp' is the color image from PrimeSense, 'color_XXXX.jpg' is the color image from DSLR.

### calibration ###

Go to /matlab and run init. This will add the calibration toolbox into the path.

Go to /matlab/Calibration, follow the [first example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example.html) to calibrate all the 'color_XXXX.jpg'.

From my own experience, it is recommend **NOT** to optimize cc and alpha. For kc, if the uncertainty is larger than the estimated value, it makes little sense to continue optimizing kc. In my experiment, I found optimizing fc only gives the best results. If you want to optimize fc only, you can run opt\_pinhole\_option before calibration. This script will turn off some options during the optimization.

After calibration, save the data, rename them as 'calib\_data\_right .mat', 'Calib\_Results\_Right .m' and 'Calib\_Results\_Right.mat'.

Similarly, calibrate all the 'color_XXXX.bmp', and rename the calibration data and results as 'left'.

Finally, run 'opt_stereo' to do stereo calibration. This will save the parameters in /matlab/Calibration.

Note that all we have done only solves the stereo calibration problem, i.e., give the transformation between **the color sensor** and the **DSLR camera**. Consider all the chessboard corners during the calibration: we have got two different depth information for each corner:

**depth 1:** PrimeSense provides depth information about each pixel in the image, so given the pixel position of each corner, we can find its depth from the depth sensor.

**depth 2:** during the calibration, we have got the extrinsic parameters for each image, and we know the position for each corner in the world coordinate. As a result, we can transform them back to the PrimeSense camera coordinate, and its z value is that corner's depth.

When depth 1 and depth 2 differ more than 10mm, for example, then we are in trouble. From my experience, this means you can see obvious misalignment when you project depth image into the external DSLR camera frame. We are inclined to trust the depth information from the depth sensor in PrimeSense. As a result, we provide a script called opt\_primesense to adjust focal length in PrimeSense such that depth 2 and depth 1 are as close as possible. It uses golden section search to find the best focal length.

Finally, you can run test\_stereo to decide whether the calibration results are accurate enough. You can pick feature points from PrimeSense's color image, then the script will transform it to DSLR's coordinate and visualize the results. Generally speaking, if the uncertainty for rotation vector is around 0.00100, and the uncertainty for translation vector is around 1, you will be fine.