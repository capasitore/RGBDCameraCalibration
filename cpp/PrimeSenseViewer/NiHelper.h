/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

#ifndef _PSV_NIHELPER_H_
#define _PSV_NIHELPER_H_

//	this header file defines some helper function in OpenNI
#include <string>

//	OpenNI header file
#include "OpenNI.h"

//	use the openni namespace
using namespace openni;

//	print the video mode information
void printVideoMode(const VideoMode &mode);

//	report any runtime error from OpenNI
void reportError(std::string errorMessage);

//	depth and color mode
void runDepthColorMode(const std::string folder,
					   const std::string depthPrefix,
					   const std::string colorPrefix,
					   const std::string depthSuffix,
					   const std::string colorSuffix);

//	depth and ir mode
void runDepthIRMode(const std::string folder,
					   const std::string depthPrefix,
					   const std::string irPrefix,
					   const std::string depthSuffix,
					   const std::string irSuffix);

#endif