/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

#include <iostream>

#include "NiHelper.h"

//	print the video mode information
void printVideoMode(const VideoMode &mode)
{
	std::cout << "xRes = " << mode.getResolutionX() << std::endl
		<< "yRes = " << mode.getResolutionY() << std::endl;
	std::cout << "Pixel = ";
	switch (mode.getPixelFormat())
	{
	case PIXEL_FORMAT_DEPTH_1_MM:
		std::cout << "DEPTH_1_MM" << std::endl;
		break;
	case PIXEL_FORMAT_DEPTH_100_UM:
		std::cout << "DEPTH_100_UM" << std::endl;
		break;
	case PIXEL_FORMAT_SHIFT_9_2:
		std::cout << "SHIFT_9_2" << std::endl;
		break;
	case PIXEL_FORMAT_SHIFT_9_3:
		std::cout << "SHIFT_9_3" << std::endl;
		break;
	case PIXEL_FORMAT_RGB888:
		std::cout << "RGB888" << std::endl;
		break;
	case PIXEL_FORMAT_YUV422:
		std::cout << "YUV422" << std::endl;
		break;
	case PIXEL_FORMAT_GRAY8:
		std::cout << "GRAY8" << std::endl;
		break;
	case PIXEL_FORMAT_GRAY16:
		std::cout << "GRAY16" << std::endl;
		break;
	case PIXEL_FORMAT_JPEG:
		std::cout << "JPEG" << std::endl;
		break;
	case PIXEL_FORMAT_YUYV:
		std::cout << "YUYV" << std::endl;
		break;
	default:
		std::cout << "unknown pixel format" << std::endl;
		break;
	}
	std::cout << "fps = " << mode.getFps() << std::endl;
}

//	report any runtime error from OpenNI
void reportError(std::string errorMessage)
{
	std::cout << errorMessage 
		<< OpenNI::getExtendedError()
		<< std::endl;
}