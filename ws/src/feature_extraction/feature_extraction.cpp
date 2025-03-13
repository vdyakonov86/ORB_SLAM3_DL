#include <iostream>

#include <opencv2/features2d.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <yolo.h>

using namespace std;

void extract_features(cv::Mat img, std::vector<cv::Mat> filter_masks, std::vector<cv::Rect> filter_boxes, std::vector<cv::KeyPoint> &kp_res, std::vector<cv::KeyPoint> &kp_rej) {
    cv::Ptr<cv::FeatureDetector> detector = cv::ORB::create();
    cv::Ptr<cv::DescriptorExtractor> descriptor = cv::ORB::create();
    std::vector<cv::KeyPoint> kp;
    detector->detect(img, kp);

    if (!filter_masks.size()) {
        kp_res = kp;
        return;
    }

    cv::Mat img_masked = img.clone();
    img_masked.setTo(cv::Scalar(0,0,0));

    for (int i = 0; i < filter_masks.size(); i++) {
        auto mask = filter_masks[i];
        auto box = filter_boxes[i];

        img_masked(box).setTo(cv::Scalar(255,255,255), mask);
    }

    for (int i = 0; i < kp.size(); i++) {
        auto x = kp[i].pt.x;
        auto y = kp[i].pt.y;

        uchar pixelValue = img_masked.at<uchar>(y, x);

        if (pixelValue == 0) {
            kp_res.push_back(kp[i]);
        }
        else {
            kp_rej.push_back(kp[i]);
        }
    }

    cv::imshow("Display window", img_masked);
    int k = cv::waitKey(0);
}

int main ( int argc, char** argv ) {
    if (argc != 7)
	{
		std::cerr << "argv input error" << std::endl;
		return -1;
	}

    string img_path = "/ws/src/feature_extraction/worker.jpg";

    std::unique_ptr<YOLO> yolo = CreateFactory::instance().create(Backend_Type(atoi(argv[1])), Task_Type(atoi(argv[2])));
	yolo->init(Algo_Type(atoi(argv[3])), Device_Type(atoi(argv[4])), Model_Type(atoi(argv[5])), argv[6]);
	yolo->infer(img_path, false, false, argv);
	yolo->release();
    auto seg_results = yolo->m_output_seg;

    std::vector<cv::Mat> human_masks;
    std::vector<cv::Rect> human_boxes;
    int human_class_id = 0;

    for (int i = 0; i < seg_results.size(); i++)
    {   
        if (seg_results[i].id == human_class_id) {
            human_masks.push_back(seg_results[i].mask);
            human_boxes.push_back(seg_results[i].box);
        }
    }

    cv::Mat img = cv::imread(img_path, cv::IMREAD_COLOR);
    std::vector<cv::KeyPoint> kp;
    std::vector<cv::KeyPoint> kp_rej;
    cv::Mat imgGray;
    cv::cvtColor(img, imgGray, cv::COLOR_BGR2GRAY);

    extract_features(imgGray, human_masks, human_boxes, kp, kp_rej);

    cv::Mat outimg;
    cv::drawKeypoints(img, kp, img, cv::Scalar(0,255,0), cv::DrawMatchesFlags::DEFAULT);
    // cv::drawKeypoints(img, kp_rej, outimg, cv::Scalar(0,0,255), cv::DrawMatchesFlags::DEFAULT);
    cv::imshow("ORB", img);
    int k1 = cv::waitKey(0); // Wait for a keystroke in the window

    return 0;
}