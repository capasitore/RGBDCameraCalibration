/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

#include <cassert>
#include "CVHelper.h"

void showPrimeSenseImages(
	const std::string windowName, 
	const VideoFrameRef &depthFrame,
	const VideoFrameRef &colorFrame)
{
	//	get the height and width of the images
	//	assume depthFrame and colorFrame has the same size
	int height = depthFrame.getHeight();
	int width = depthFrame.getWidth();
	assert(height == colorFrame.getHeight());
	assert(width == colorFrame.getWidth());

	//	concatenate depth and color images together
	cv::Mat image = cv::Mat::zeros(height, width * 2, CV_8UC3);
	//	draw the depth image first
	DepthPixel* pDepth = (DepthPixel *)depthFrame.getData();
	int minDepth = 500;
	int maxDepth = 2000;
	for (int i = 0; i < height; i++)
	{
		for (int j = 0; j < width; j++)
		{
			//	the depth is clampped into [minDepth, maxDepth)
			int depth = int(*pDepth);
			depth = depth >= minDepth ? depth : minDepth;
			depth = depth < maxDepth ? depth : maxDepth - 1;
			float grayScale = (depth - minDepth) * 256.f / (maxDepth - minDepth);
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)grayScale;
			pDepth++;
		}
	}

	//	draw the color image
	RGB888Pixel* pColor = (RGB888Pixel *)colorFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = width; j < 2 * width; j++)
		{
			unsigned char* pColorInPixel = (unsigned char*)pColor;
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)pColorInPixel[2];	//	b
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)pColorInPixel[1];	//	g
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)pColorInPixel[0];	//	r
			pColor++;
		}
	}

	//	show the image
	cv::namedWindow(windowName, cv::WINDOW_AUTOSIZE);
	cv::imshow(windowName, image);
	//	wait for an input to terminate
	cv::waitKey(0);
	cv::destroyWindow(windowName);
}