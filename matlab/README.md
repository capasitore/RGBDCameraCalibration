## RGBDCameraCalibration - matlab part ##

### prepare your images ###

You should have three kinds of images: depth images from PrimeSense, color images or ir images from PrimeSense, and color images from your external DSLR cameras. In either case, the depth/color images or the depth/ir images from the PrimeSense should already be aligned. Put all of them in the folder /matlab/calibration. We have provided 57 sample images for your reference. 'depth\_XXXX.png' is the depth image from PrimeSense, 'color\_XXXX.bmp' is the color image from PrimeSense, 'color\_XXXX.jpg' is the color image from DSLR.

### resize the DSLR color images ###

Probably your DSLR will provide extremely high resolution images(like 3000x4000 or even higher) in the calibration. Such high resolution images would be a bottleneck when you are trying to process them in the future experiments. We provide a script **resize\_color\_images** to help resize them. It will go over all the color\_XXXX.jpg images and resize them into 1/4 x 1/4 of the original size. Of course you can modify the ratio if it does not work for you.
 
### calibration ###

Go to /matlab and run init. This will add the calibration toolbox into the path.

Go to /matlab/Calibration, follow the [first example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example.html) to calibrate all the 'color_XXXX.jpg'.

From my own experience, it is recommend **NOT** to optimize cc and alpha. For kc, if the uncertainty is larger than the estimated value, it makes little sense to continue optimizing kc. In my experiment, I found optimizing fc only gives the best results. If you want to optimize fc only, you can run opt\_pinhole\_option before calibration. This script will turn off some options during the optimization.

After calibration, save the data, rename them as 'calib\_data\_right .mat', 'Calib\_Results\_Right .m' and 'Calib\_Results\_Right.mat'.

The next step is to calibrate the PrimeSense camera. Here you have two options:

1. if you choose to capture color images from the PrimeSense, then just do exactly the same thing as you did in the previous step: calibrate all the 'color\_XXXX.bmp', and rename the calibration data and results as 'left'.
2. if you choose to capture ir images from the PrimeSense, things will be a little different. The ir images are saved as png images. We should first color them so that they are visible(both for human eyes and for the calibration toolbox so that it can find the corner of the chessboard!). **Run convert\_ir\_images** will help you convert your ir images into regular rgb images, and then you can run calib\_gui to calibrate on the
 converted ir images.

Finally, run **opt\_stereo** to do stereo calibration. This will save the stereo parameters in /matlab/Calibration.

Note that all we have done only solves the stereo calibration problem, i.e., give the transformation between **the color/ir sensor** and the **DSLR camera**. Consider all the chessboard corners during the calibration: we have got two different depth information for each corner:

**depth 1:** PrimeSense provides depth information about each pixel in the image, so given the pixel position of each corner, we can find its depth from the depth sensor.

**depth 2:** during the calibration, we have got the extrinsic parameters for each image, and we know the position for each corner in the world coordinate. As a result, we can transform them back to the PrimeSense camera coordinate, and its z value is that corner's depth.

When depth 1 and depth 2 differ more than 10mm, for example, then we are in trouble. From my experience, this means you can see obvious misalignment when you project depth image into the external DSLR camera frame. We are inclined to trust the depth information from the depth sensor in PrimeSense. As a result, we provide a script called opt\_primesense to adjust focal length in PrimeSense such that depth 2 and depth 1 are as close as possible. It uses golden section search to find the best focal length(More detailed explanation needed!).

Finally, you can **run test\_stereo** to decide whether the calibration results are accurate enough(If you capture data from the ir sensor, you will need to run **convert\_ir\_images** befor the test). You can pick feature points from PrimeSense's color/ir images, then the script will transform it to DSLR's coordinate and visualize the results. Generally speaking, if the uncertainty for rotation vector is around 0.00100, and the uncertainty for translation vector is around 1, you will be fine.