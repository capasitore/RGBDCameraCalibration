## RGBDCameraCalibration ##

**RGBDCameraCalibration** is a cute project to display how to calibration a stereo camera system consisting of a DSLR camera and a PrimeSense. The goal is to calibrate the transformation matrix between the depth image from the PrimeSense and the color image from an external DSLR.

In PrimeSense, there are three data streams: color stream, depth stream and ir stream. Depth and ir streams come from the same sensor and color stream has a separate sensor. To calibrate the stereo system (the depth sensor and the external DSLR camera), We have two possible solutions: 

**Method A:** we first align the depth image to the color image in PrimeSense, which can be done by using OpenNI, then we calibrate the color sensor and the DSLR camera. In that case, the depth image will be transformed twice: from depth sensor to the color sensor, then from the color sensor to the DSLR.

**Method B:** we could use the ir image to calibrate the ir sensor and the DSLR camera directly. Since the ir image and the depth image come from the same sensor, in this case, the depth image will be transformed only once: from the ir sensor to the DSLR camera. However, the ir images are not standard RGB images, and therefore may be harder to process.

We provide a tiny program to help capture depth/color and depth/ir images.

### configuration ###
Microsoft Visual Studio 2012 + Matlab 2013b.

About the depth sensor: you may need to do some modifications depending on the depth sensor and the operation system you use:

If you are using PrimeSense, make sure you have commented line 28 in /cpp/Bin/OpenNI2/Drivers/PS1080.ini(the ; means starting a comment line in its ini file):

;UsbInterface=2

If you are using Structure Sensor, please refer to [this line](http://com.occipital.openni.s3.amazonaws.com/Structure%20Sensor%20OpenNI2%20Quick%20Start%20Guide.pdf) for proper modifications on your PS1080.ini. Specifically, for windows user, you can change line 28 from 

;UsbInterface=2

to

UsbInterface=0

### c++ part ###
We provide a small program under /cpp to help capture depth/color or depth/ir images from the PrimeSense sensors. Please go to /PrimeSenseViewer and double click PrimeSenseViewer.sln, and build the project in Release & x64 mode. 

The program is controlled by the keyboard. Once you see the display window, you can choose:

'e': exit

's': save the current images. The images will be saved in /cpp/Images/. There are some sample images there for your reference.

any other keys: continue to capture the next frame.

In the console some real time information is provided to reflect the current status, or report an error if any.

About each folder:

**/3rdparty:** 3rd party libraries used in the project. 

**/Bin:** the output .exe file.

**/Images:** the default directory to store the captured images. Some sample images have been provided.

**/PrimeSenseViewer:** the cpp code.

### matlab part ###

**Special thanks to Jean-Yves Bouguet for the [calibration toolbox](http://www.vision.caltech.edu/bouguetj/calib_doc/).** The [first](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example.html) and [fifth example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example5.html) are extremely useful for this project, and I highly recommend them!

Here is an overview of what we need to do in this part:

**1. find a good DSLR camera!** If possible, set everything to the **manual** mode in your camera. **DO NOT USE** auto focus.

**2. mount the PrimeSense and your DSLR together:** I found [DepthKit](http://www.rgbdtoolkit.com/index.html) very helpful. If you cannot mount them by yourself, DepthKit is a good option. The mount can be placed on a tripod too. They also have a tutorial about how to calibrate the RGBD camera systems. 

**3. capture depth and color images:** We need to capture depth and color images from PrimeSense(or depth and ir images from PrimeSense, depending on what you like), and color images from DSLR. 

**4. optimize the focal length:** in some cases, if your PrimeSense does not provide very accurate registration between the depth and the color sensor, it might be necessary to optimize the focal length manually. We use golden section search to figure out the best focal length in the function opt\_primesense. Details are attached in \matlab\README.md

**5. stereo calibration:** Follow [the fifth example](http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/example5.html) in the calibration toolbox to calibrate the color sensor and DSLR.

Please visit /matlab to find more details.

**contact me**

Till now calibrating RGBD camera system is still a quite tedious task for me. If you have better ideas, feel free to send an email to <taodu@stanford.edu> and tell us your comments!