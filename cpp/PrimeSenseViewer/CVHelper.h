/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

#ifndef _PSV_CVHELPER_H_
#define _PSV_CVHELPER_H_

//	this header file defines the visualization functions
//	for the depth and rgb images

#include <string>

#include "opencv2\core\core.hpp"
#include "opencv2\highgui\highgui.hpp"

#include "NiHelper.h"

//	use opencv to display the depth and color image
//	together
void showPrimeSenseImages(
	const std::string windowName, 
	const VideoFrameRef &depthFrame,
	const VideoFrameRef &colorFrame);

#endif