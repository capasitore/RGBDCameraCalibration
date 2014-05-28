/*
Tao Du
taodu@stanford.edu
May 26, 2014
*/

//	this program captures rgb/depth/ir frame from PrimeSense
//	the resolution is 480x640 by default at 30 fps
//	we use OpenGL to show the frame

#include <iostream>

#include "CVHelper.h"
#include "NiHelper.h"

void usage()
{
	std::cout << "Usage: " <<  std::endl
		<< "s: save" << std::endl
		<< "e: exit" << std::endl
		<< "any other key: new frame" << std::endl;
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
		//	set color resolution, mirror
		if (color.getMirroringEnabled())
			color.setMirroringEnabled(false);
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
				color.setVideoMode(*pSupportedMode);
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
	//	show the depth and color images
	//	print the usage
	usage();
	bool isRunning = true;
	VideoFrameRef depthFrame, colorFrame;
	while (isRunning)
	{
		//	capture the depth frame
		VideoStream* pDepthStream = &depth;
		int changedStreamDummy;
		//	wait for 2000ms
		rc = OpenNI::waitForAnyStream(&pDepthStream, 1, &changedStreamDummy, 2000);
		if (rc != STATUS_OK)
		{
			std::cout << "time out" << std::endl;
			isRunning = false;
			break;
		}
		rc = depth.readFrame(&depthFrame);
		if (rc != STATUS_OK)
		{
			reportError("fail to read depth image: ");
			isRunning = false;
			break;
		}
		//	capture the color frame
		VideoStream* pColorStream = &color;
		rc = OpenNI::waitForAnyStream(&pColorStream, 1, &changedStreamDummy, 2000);
		if (rc != STATUS_OK)
		{
			std::cout << "time out" << std::endl;
			isRunning = false;
			break;
		}
		rc = color.readFrame(&colorFrame);
		if (rc != STATUS_OK)
		{
			reportError("fail to read color image: ");
			isRunning = false;
			break;
		}
		//	use opencv to show the image
		showPrimeSenseImages("images", depthFrame, colorFrame);

		char ch;
		std::cin >> ch;
		switch (ch)
		{
		case 'e':	//	exit
			std::cout << "exit" << std::endl;
			isRunning = false;
			break;
		case 's':	//	save the current frame
			std::cout << "save the current image ..." << std::endl;
			//	save the depth image

			//	save the rgb image

			std::cout << "done" << std::endl;
			break;
		default:	//	capture a new frame
			//	do nothing
			std::cout << "capture a new frame ..." << std::endl;
			break;
		}
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