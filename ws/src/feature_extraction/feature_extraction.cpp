#include <iostream>

#include <opencv2/features2d.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace std;
// using namespace cv;

int main ( int argc, char** argv ) {
    string path_to_data = "/Datasets/TUM/rgbd_dataset_freiburg3_sitting_static/rgb/";
    // string img_path = "/Datasets/EuRoC/MH01/mav0/cam0/data/1403636759063555584.png";
    string img_path = "/dl_ws/src/feature_extraction/worker.jpg";
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