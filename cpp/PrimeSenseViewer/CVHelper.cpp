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
			float grayScale = (depth - minDepth) * 256.f / (maxDepth - minDepth);
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)grayScale;
			pDepth++;
		}
	}
	//	draw the ir image
	int minIR = 0;
	int maxIR = 1500;
	Grayscale16Pixel* pIR = (Grayscale16Pixel *)irFrame.getData();
	for (int i = 0; i < height; i++)
	{
		for (int j = width; j < 2 * width; j++)
		{
			//	the ir is clampped into [minIR, maxIR)
			int ir = int(*pIR);
			ir = ir >= minIR ? ir : minIR;
			ir = ir < maxIR ? ir : maxIR - 1;
			float grayScale = (ir - minIR) * 256.f / (maxIR - minIR);
			image.at<cv::Vec3b>(i, j)[0] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[1] = (unsigned char)grayScale;
			image.at<cv::Vec3b>(i, j)[2] = (unsigned char)grayScale;
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