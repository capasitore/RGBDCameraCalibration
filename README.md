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
TODO
