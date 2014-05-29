## RGBDCameraCalibration ##

**RGBDCameraCalibration** is a cute project to display how to calibration a stereo camera system consisting of a DSLR camera and a PrimeSense. The goal is to calibrate the transformation matrix between the depth image from the PrimeSense and the color image from an external DSLR.

In PrimeSense, there are three data streams: color stream, depth stream and ir stream. Depth and ir streams come from the same sensor and color stream has a separate sensor. To calibrate the stereo system (the depth sensor and the external DSLR camera), We have two possible solutions: 

**Method A:** we first align the depth image to the color image in PrimeSense, which can be done by using OpenNI, then we calibrate the color sensor and the DSLR camera. In that case, the depth image will be transformed twice: from depth sensor to the color sensor, then from the color sensor to the DSLR.

**Method B:** we could use the ir image to calibrate the ir sensor and the DSLR camera directly. Since the ir image and the depth image comes from the same sensor, in this case, the depth image will be transformed only once: from the ir sensor to the DSLR camera.

We provide a tiny program to help capture depth/color and depth/ir images.

### configuration ###
Microsoft Visual Studio 2012 + Matlab 2013b

### C++ part ###
We provide a small program under /cpp to help capture depth/color or depth/ir images from the PrimeSense sensors. Please go to /PrimeSenseViewer and double click PrimeSenseViewer.sln, and build the project in Release & x64 mode. 

The program is controlled by the keyboard. Once you see the display window, you can choose:

'e': exit

's': save the current depth and color images. The images will be saved in /cpp/Images/. There are some sample images there for your reference.

any other keys: continue to capture the next frame.

In the console some real time information is provided to reflect the current status, or report an error if any.

About each folder:

**/3rdparty:** 3rd party libraries used in the project. 

**/Bin:** the output .exe file.

**/Images:** the default directory to store the captured depth and color images. Some sample images have been provided.

**/PrimeSenseViewer:** the cpp code.

### Matlab part ###

**Special thanks to Jean-Yves Bouguet for the [calibration toolbox](http://www.vision.caltech.edu/bouguetj/calib_doc/).** The [first](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example.html) and [fifth example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example5.html) are extremely useful for this project, and I highly recommend them!

Here is an overview of what we need to do in this part:

**1. find a good DSLR camera!** If possible, set everything to the **manual** mode in your camera. **DO NOT USE** auto focus.

**2. mount the PrimeSense and your DSLR together:** I found [DepthKit](http://www.rgbdtoolkit.com/index.html) very helpful. If you cannot mount them by yourself, DepthKit is a good option. The mount can be placed on a tripod too.

**3. capture depth and color images:** We need to capture depth and color images from PrimeSense, and color images from DSLR. 

**4. optimize the focal length:** use the depth information to further optimize the focal length of the color sensor in PrimeSense.

**5. stereo calibration: ** Follow [the fifth example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example5.html) in the calibration toolbox to calibrate the color sensor and DSLR.

Please visit /matlab to find more details.

**contact us**

Till now calibrating RGBD camera system is still a quite tedious work for me. If you have better ideas, feel free to send an email to <taodu@stanford.edu> and tell us your comments!