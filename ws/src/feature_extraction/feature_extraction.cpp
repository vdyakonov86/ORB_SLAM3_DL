#include <iostream>

#include <opencv2/features2d.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <yolo.h>

using namespace std;

int main ( int argc, char** argv ) {
    if (argc != 7)
	{
		std::cerr << "argv input error" << std::endl;
		return -1;
	}

    string img_path = "/ws/src/feature_extraction/worker.jpg";

    std::unique_ptr<YOLO> yolo = CreateFactory::instance().create(Backend_Type(atoi(argv[1])), Task_Type(atoi(argv[2])));
	yolo->init(Algo_Type(atoi(argv[3])), Device_Type(atoi(argv[4])), Model_Type(atoi(argv[5])), argv[6]);
	yolo->infer(img_path, true, true, argv);
	yolo->release();

    cv::Mat img = cv::imread ( img_path, cv::IMREAD_COLOR );

    cv::imshow("Display window", img);
    int k = cv::waitKey(0); // Wait for a keystroke in the window

    std::vector<cv::KeyPoint> keypoints;
    cv::Mat descriptors;
    
    cv::Ptr<cv::FeatureDetector> detector = cv::ORB::create();
    cv::Ptr<cv::DescriptorExtractor> descriptor = cv::ORB::create();

    detector->detect(img, keypoints);
    descriptor->compute(img, keypoints, descriptors);

    cv::Mat outimg;

    cv::drawKeypoints(img, keypoints, outimg, cv::Scalar::all(-1), cv::DrawMatchesFlags::DEFAULT);
    cv::imshow("ORB", outimg);
    k = cv::waitKey(0); // Wait for a keystroke in the window

    return 0;
}