/*
Tao Du
taodu@stanford.edu
May 27, 2014
*/

//	warning: assert is only useful in debug mode
//	so it is recommended to run the program in debug
//	mode first, make sure there are no assertion failures
//	then move to release mode
#include <cassert>
#include "CVHelper.h"

//	the colormap
//	copied from matlab's jet colormap
//	used to show depth and ir images

#define COLOR_MAP_NUM		64
#define COLOR_MAP_CHANNEL	3

double colorMap[COLOR_MAP_NUM][COLOR_MAP_CHANNEL] = {
	{0.000000, 0.000000, 0.562500},
	{0.000000, 0.000000, 0.625000},
	{0.000000, 0.000000, 0.687500},
	{0.000000, 0.000000, 0.750000},
	{0.000000, 0.000000, 0.812500},
	{0.000000, 0.000000, 0.875000},
	{0.000000, 0.000000, 0.937500},
	{0.000000, 0.000000, 1.000000},
	{0.000000, 0.062500, 1.000000},
	{0.000000, 0.125000, 1.000000},
	{0.000000, 0.187500, 1.000000},
	{0.000000, 0.250000, 1.000000},
	{0.000000, 0.312500, 1.000000},
	{0.000000, 0.375000, 1.000000},
	{0.000000, 0.437500, 1.000000},
	{0.000000, 0.500000, 1.000000},
	{0.000000, 0.562500, 1.000000},
	{0.000000, 0.625000, 1.000000},
	{0.000000, 0.687500, 1.000000},
	{0.000000, 0.750000, 1.000000},
	{0.000000, 0.812500, 1.000000},
	{0.000000, 0.875000, 1.000000},
	{0.000000, 0.937500, 1.000000},
	{0.000000, 1.000000, 1.000000},
	{0.062500, 1.000000, 0.937500},
	{0.125000, 1.000000, 0.875000},
	{0.187500, 1.000000, 0.812500},
	{0.250000, 1.000000, 0.750000},
	{0.312500, 1.000000, 0.687500},
	{0.375000, 1.000000, 0.625000},
	{0.437500, 1.000000, 0.562500},
	{0.500000, 1.000000, 0.500000},
	{0.562500, 1.000000, 0.437500},
	{0.625000, 1.000000, 0.375000},
	{0.687500, 1.000000, 0.312500},
	{0.750000, 1.000000, 0.250000},
	{0.812500, 1.000000, 0.187500},
	{0.875000, 1.000000, 0.125000},
	{0.937500, 1.000000, 0.062500},
	{1.000000, 1.000000, 0.000000},
	{1.000000, 0.937500, 0.000000},
	{1.000000, 0.875000, 0.000000},
	{1.000000, 0.812500, 0.000000},
	{1.000000, 0.750000, 0.000000},
	{1.000000, 0.687500, 0.000000},
	{1.000000, 0.625000, 0.000000},
	{1.000000, 0.562500, 0.000000},
	{1.000000, 0.500000, 0.000000},
	{1.000000, 0.437500, 0.000000},
	{1.000000, 0.375000, 0.000000},
	{1.000000, 0.312500, 0.000000},
	{1.000000, 0.250000, 0.000000},
	{1.000000, 0.187500, 0.000000},
	{1.000000, 0.125000, 0.000000},
	{1.000000, 0.062500, 0.000000},
	{1.000000, 0.000000, 0.000000},
	{0.937500, 0.000000, 0.000000},
	{0.875000, 0.000000, 0.000000},
	{0.812500, 0.000000, 0.000000},
	{0.750000, 0.000000, 0.000000},
	{0.687500, 0.000000, 0.000000},
	{0.625000, 0.000000, 0.000000},
	{0.562500, 0.000000, 0.000000},
	{0.500000, 0.000000, 0.000000}
};


char showDepthColorImages(
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
			int colorMapId = int((depth - minDepth) * COLOR_MAP_NUM / (maxDepth - minDepth));
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)(colorMap[colorMapId][2] * 255.0);	//	b channel
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)(colorMap[colorMapId][1] * 255.0);	//	g channel
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)(colorMap[colorMapId][0] * 255.0);	//	r channel
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
	cv::imshow(windowName, image);
	//	wait for an input to terminate
	char key = char(cv::waitKey(0));
	return key;
}

//	use opencv to display the depth and ir images
//	return the key pressed in waitKey()
char showDepthIRImages(
	const std::string windowName,
	const VideoFrameRef &depthFrame,
	const VideoFrameRef &irFrame
)
{
	//	get the height and width of the images
	//	assume depthFrame and colorFrame has the same size
	int height = depthFrame.getHeight();
	int width = depthFrame.getWidth();
	assert(height == irFrame.getHeight());
	assert(width == irFrame.getWidth());

	//	both depth pixel and ir pixel are in uint16
	//	concatenate them together
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
			int colorMapId = int((depth - minDepth) * COLOR_MAP_NUM / (maxDepth - minDepth));
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)(colorMap[colorMapId][2] * 255.0);	//	b channel
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)(colorMap[colorMapId][1] * 255.0);	//	g channel
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)(colorMap[colorMapId][0] * 255.0);	//	r channel
			pDepth++;
		}
	}
	//	draw the ir image
	Grayscale16Pixel* pIR = (Grayscale16Pixel *)irFrame.getData();
	int minIR = INT_MAX;
	int maxIR = INT_MIN;
	//	find minimum and maximum IR
	for (int i = 0; i < height; i++)
		for (int j = 0; j < width; j++)
		{
			int ir = int(*pIR);
			if (ir < minIR)
				minIR = ir;
			if (ir > maxIR)
				maxIR = ir;
			pIR++;
		}
	//	intentionally add maxIR by 1
	//	this will avoid overflow in the following for loops
	maxIR++;
	//	reset pIR
	pIR = (Grayscale16Pixel *)irFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = width; j < 2 * width; j++)
		{
			int ir = int(*pIR);
			int colorMapId = int((ir - minIR) * COLOR_MAP_NUM / (maxIR - minIR));
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)(colorMap[colorMapId][2] * 255.0);	//	b channel
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)(colorMap[colorMapId][1] * 255.0);	//	g channel
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)(colorMap[colorMapId][0] * 255.0);	//	r channel
			pIR++;
		}
	}

	//	show the image
	cv::imshow(windowName, image);
	//	wait for an input to terminate
	char key = char(cv::waitKey(0));
	return key;
}

//	save depth images
void saveDepthImage(const std::string name, const VideoFrameRef &depthFrame)
{
	int height = depthFrame.getHeight();
	int width = depthFrame.getWidth();
	cv::Mat image = cv::Mat::zeros(height, width, CV_16UC1);
	DepthPixel *pDepth = (DepthPixel *)depthFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = 0; j < width; j++)
		{
			image.at<uint16_t>(i, j) = (uint16_t)(*pDepth);
			pDepth++;
		}
	}
	cv::imwrite(name, image);
}

//	save color images
void saveColorImage(const std::string name, const VideoFrameRef &colorFrame)
{
	int height = colorFrame.getHeight();
	int width = colorFrame.getWidth();
	cv::Mat image = cv::Mat::zeros(height, width, CV_8UC3);
	RGB888Pixel* pColor = (RGB888Pixel *)colorFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = 0; j < width; j++)
		{
			unsigned char* pColorInPixel = (unsigned char*)pColor;
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)pColorInPixel[2];	//	b
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)pColorInPixel[1];	//	g
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)pColorInPixel[0];	//	r
			pColor++;
		}
	}
	cv::imwrite(name, image);
}

//	save ir images
void saveIRImage(const std::string name, const VideoFrameRef &irFrame)
{
	//	the same as saving the depth image
	int height = irFrame.getHeight();
	int width = irFrame.getWidth();
	cv::Mat image = cv::Mat::zeros(height, width, CV_16UC1);
	Grayscale16Pixel *pIR = (Grayscale16Pixel *)irFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = 0; j < width; j++)
		{
			image.at<uint16_t>(i, j) = (uint16_t)(*pIR);
			pIR++;
		}
	}
	cv::imwrite(name, image);
}