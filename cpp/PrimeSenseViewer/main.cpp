/*
Tao Du
taodu@stanford.edu
May 26, 2014
*/

//	this program captures color/depth/ir frame from PrimeSense
//	the resolution is 480x640 by default at 30 fps
//	we use OpenCV to display and save the depth and color images

//	this program is designed to help calibrate the RGBD camera system
//	the ouput will be a pair of aligned depth/color image, or depth/ir
//	image, depending on which one you prefer.

//	In PrimeSense, there are a depth sensor, an ir sensor(the same as)
//	the depth sensor, and a color sensor. To calibrate the RGBD camera
//	system with another external DSLR camera, we have two choices:

//	mode 1: use the depth and color sensor, use the image registration
//	option in PrimeSense to align the depth image and color image first,
//	then calibrate the color sensor and the external DSLR camera.

//	mode 2: in case the image registration is not accurate enough, we can
//	use the ir image. Since the ir and depth sensors are the same, there
//	is no need to do image registeration. We can directly calibrate the 
//	ir sensor and the external DSLR camera.

#include <iostream>
#include <sstream>

#include "CVHelper.h"
#include "NiHelper.h"

//	the folder to store depth and color image
//	name convention:
//	depth_0001.png
//	color_0001.bmp
//	ir_0001.png

//	change the string here if you want to save in other directories
//	or use other names
const std::string folder = "../Images/";
const std::string depthPrefix = "depth_";
const std::string colorPrefix = "color_";
const std::string irPrefix = "ir_";
const std::string depthSuffix = ".png";
const std::string colorSuffix = ".bmp";
const std::string irSuffix = ".png";

void usage()
{
	std::cout << "usage: " <<  std::endl
		<< "=== welcome! ===" << std::endl
		<< "mode 1: depth + color images" << std::endl
		<< "mode 2: depth + ir images" << std::endl
		<< "=== when the display window is prompted ===" << std::endl
		<< "s: save" << std::endl
		<< "e: exit" << std::endl
		<< "any other key: new frame" << std::endl
		<< "=== have fun! ===" << std::endl;
}

int main(int argc, char *argv[])
{
	//	usage information
	usage();
	//	which mode are we in?
	int mode;
	std::cout << "select the mode you need (1 or 2): " << std::endl;
	std::cin >> mode;
	switch (mode)
	{
	case 1:	//	depth + color mode
		{
			runDepthColorMode(folder, depthPrefix, colorPrefix,
				depthSuffix, irSuffix);
			break;
		}
	case 2:	//	depth + ir mode
		{
			runDepthIRMode(folder, depthPrefix, irPrefix,
				depthSuffix, irSuffix);
			break;
		}
	default:
		{
			std::cout << "unknown mode." << std::endl;
			return 0;
		}
	}
	return 0;
}