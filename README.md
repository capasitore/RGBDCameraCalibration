## RGBDCameraCalibration ##

**RGBDCameraCalibration** is a cute project to display how to calibration a stereo camera system consisting of a DSLR camera and a PrimeSense. 

### configuration ###
Microsoft Visual Studio 2012 + Matlab 2013b

### C++ part ###
We provide a small program under /cpp to help capture depth and color images from the PrimeSense sensors. Please go to /PrimeSenseViewer and double click PrimeSenseViewer.sln, and build the project in Release & x64 mode. The depth and color images from the PrimeSense will be displayed on the screen.

The program is controlled by the keyboard. Once you see the display window, you can choose:
'e': exit
's': save the current depth and color images. The images will be saved in /cpp/Images/. There are some sample images there for your reference.
any other keys: continue to capture the next frame.

In the console some real time information is provided to reflect the current status, or report an error if any.

About each folder:
/3rdparty: 3rd party libraries used in the project. 
/Bin: the output .exe file.
/Images: the default directory to store the captured depth and color images. Some sample images have been provided.
/PrimeSenseViewer: the cpp code.

### Matlab part ###
TODO
