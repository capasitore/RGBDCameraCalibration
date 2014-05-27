/*
Tao Du
taodu@stanford.edu
May 26, 2014
*/

//	this program captures rgb/depth/ir frame from PrimeSense
//	the resolution is 480x640 by default at 30 fps
//	we use OpenGL to show the frame

#include <iostream>
#include <string>
//	OpenNI header file
#include "OpenNI.h"

using namespace openni;

#define  SAMPLE_READ_WAIT_TIMEOUT 2000

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

void reportError(std::string errorMessage)
{
	std::cout << errorMessage 
		<< OpenNI::getExtendedError()
		<< std::endl;
}

int main(int argc, char *argv[])
{
	//	initialize the PrimeSense
	Status rc = OpenNI::initialize();
	if (rc != STATUS_OK)
	{
		reportError("fail to initialize: ");
		return 0;
	}
	//	open the device
	Device device;
	rc = device.open(ANY_DEVICE);
	if (rc != STATUS_OK)
	{
		reportError("fail to open the device: ");
		return 0;
	}

	//	open depth and color streams
	VideoStream color, depth;
	if (device.getSensorInfo(SENSOR_DEPTH) != NULL)
	{
		rc = depth.create(device, SENSOR_DEPTH);
		if (rc != STATUS_OK)
		{
			reportError("fail to create depth stream: ");
			return 0;
		}
		//	set depth resolution, mirror, registration
		if (depth.getMirroringEnabled())
			depth.setMirroringEnabled(false);
		//	all the modes supported by the sensor
		const SensorInfo* pSensorInfo = device.getSensorInfo(SENSOR_DEPTH);
		const openni::Array<VideoMode> &mode = pSensorInfo->getSupportedVideoModes();
		//	by default, we use 480 x 640, 1mm and 30 fps
		bool settingSucceed = false;
		for (int i = 0; i < mode.getSize(); i++)
		{
			const openni::VideoMode* pSupportedMode = &mode[i];
			if (pSupportedMode->getResolutionX() == 640 && pSupportedMode->getResolutionY() == 480
				&& pSupportedMode->getPixelFormat() == PIXEL_FORMAT_DEPTH_1_MM
				&& pSupportedMode->getFps() == 30)
			{
				depth.setVideoMode(*pSupportedMode);
				settingSucceed = true;
				break;
			}
		}
		if (!settingSucceed)
		{
			std::cout << "fail to set desired mode!" << std::endl;
			return 0;
		}
	}
	//	color stream
	if (device.getSensorInfo(SENSOR_COLOR) != NULL)
	{
		rc = color.create(device, SENSOR_COLOR);
		if (rc != STATUS_OK)
		{
			reportError("fail to create color stream: ");
			return 0;
		}
		//	set depth resolution, mirror, registration
		if (depth.getMirroringEnabled())
			depth.setMirroringEnabled(false);
		//	all the modes supported by the sensor
		const SensorInfo* pSensorInfo = device.getSensorInfo(SENSOR_COLOR);
		const openni::Array<VideoMode> &mode = pSensorInfo->getSupportedVideoModes();
		//	by default, we use 480 x 640, RGB888 and 30 fps
		bool settingSucceed = false;
		for (int i = 0; i < mode.getSize(); i++)
		{
			const openni::VideoMode* pSupportedMode = &mode[i];
			if (pSupportedMode->getResolutionX() == 640 && pSupportedMode->getResolutionY() == 480
				&& pSupportedMode->getPixelFormat() == PIXEL_FORMAT_RGB888
				&& pSupportedMode->getFps() == 30)
			{
				depth.setVideoMode(*pSupportedMode);
				settingSucceed = true;
				break;
			}
		}
		if (!settingSucceed)
		{
			std::cout << "fail to set desired mode!" << std::endl;
			return 0;
		}

	}
	//	turn on image registration
	if (device.isImageRegistrationModeSupported(IMAGE_REGISTRATION_DEPTH_TO_COLOR))
	{
		rc = device.setImageRegistrationMode(IMAGE_REGISTRATION_DEPTH_TO_COLOR);
		if (rc != STATUS_OK)
		{
			reportError("fail to support image registration");
			return 0;
		}
	}
	else
	{
		std::cout << "fail to support image registration" << std::endl;
		return 0;
	}
	//	start depth stream
	rc = depth.start();
	if (rc != STATUS_OK)
	{
		reportError("fail to start depth stream: ");
		return 0;
	}
	//	start color stream
	rc = color.start();
	if (rc != STATUS_OK)
	{
		reportError("fail to start color stream: ");
		return 0;
	}

	//	stop the device
	depth.stop();
	depth.destroy();
	color.stop();
	color.destroy();
	//	close the device
	device.close();
	OpenNI::shutdown();

	return 0;
}