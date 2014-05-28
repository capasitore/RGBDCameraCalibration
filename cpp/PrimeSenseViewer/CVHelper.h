/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

#ifndef _PSV_CVHELPER_H_
#define _PSV_CVHELPER_H_

//	this header file defines the visualization functions
//	for the depth and color images

#include <string>

#include "opencv2\core\core.hpp"
#include "opencv2\highgui\highgui.hpp"

#include "NiHelper.h"

//	use opencv to display the depth and color images
//	return the key pressed in waitKey()
char showDepthColorImages(
	const std::string windowName, 
	const VideoFrameRef &depthFrame,
	const VideoFrameRef &colorFrame
);

//	use opencv to display the depth and ir images
//	return the key pressed in waitKey()
char showDepthIRImages(
	const std::string windowName,
	const VideoFrameRef &depthFrame,
	const VideoFrameRef &irFrame
);

//	save depth images
void saveDepthImage(const std::string name, const VideoFrameRef &depthFrame);

//	save color images
void saveColorImage(const std::string name, const VideoFrameRef &colorFrame);

//	save ir images
void saveIRImage(const std::string name, const VideoFrameRef &irFrame);

#endif