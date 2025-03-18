#pragma once

#include "yolo-inference/yolo_classify.h"
#include "yolo-inference/yolo_detect.h"
#include "yolo-inference/yolo_segment.h"
#include "yolo-inference/utils.h"
#include <opencv2/opencv.hpp>
/**
 * @description: opencv inference class for YOLO algorithm
 */
class YOLO_OpenCV : virtual public YOLO
{
public:
	/**
	 * @description: 					initialization interface
	 * @param {Algo_Type} algo_type		algorithm type
	 * @param {Device_Type} device_type	device type
	 * @param {Model_Type} model_type	model type
	 * @param {string} model_path		model path
	 * @return {*}
	 */
	void init(const Algo_Type algo_type, const Device_Type device_type, const Model_Type model_type, const std::string model_path);

protected:
	/**
	 * @description: model inference
	 * @return {*}
	 */
	void process();

	/**
	 * @description: inference engine
	 */
	cv::dnn::Net m_net;

	/**
	 * @description: model input
	 */
	cv::Mat m_input;

	/**
	 * @description: model output
	 */
	std::vector<cv::Mat> m_output;
};

/**
 * @description: opencv inference class for the yolo classification algorithm
 */
class YOLO_OpenCV_Classify : public YOLO_OpenCV, public YOLO_Classify
{
public:
	/**
	 * @description: 					initialization interface
	 * @param {Algo_Type} algo_type		algorithm type
	 * @param {Device_Type} device_type	device type
	 * @param {Model_Type} model_type	model type
	 * @param {string} model_path		model path
	 * @return {*}
	 */
	void init(const Algo_Type algo_type, const Device_Type device_type, const Model_Type model_type, const std::string model_path);

private:
	/**
	 * @description: model pre-process
	 * @return {*}
	 */
	void pre_process();

	/**
	 * @description: model post-process
	 * @return {*}
	 */
	void post_process();
};

/**
 * @description: opencv inference class for the yolo detection algorithm
 */
class YOLO_OpenCV_Detect : public YOLO_OpenCV, public YOLO_Detect
{
public:
	/**
	 * @description: 					initialization interface
	 * @param {Algo_Type} algo_type		algorithm type
	 * @param {Device_Type} device_type	device type
	 * @param {Model_Type} model_type	model type
	 * @param {string} model_path		model path
	 * @return {*}
	 */
	void init(const Algo_Type algo_type, const Device_Type device_type, const Model_Type model_type, const std::string model_path);

private:
	/**
	 * @description: model pre-process
	 * @return {*}
	 */
	void pre_process();

	/**
	 * @description: model post-process
	 * @return {*}
	 */
	void post_process();
};

/**
 * @description: opencv inference class for the yolo segmentation algorithm
 */
class YOLO_OpenCV_Segment : public YOLO_OpenCV, public YOLO_Segment
{
public:
	/**
	 * @description: 					initialization interface
	 * @param {Algo_Type} algo_type		algorithm type
	 * @param {Device_Type} device_type	device type
	 * @param {Model_Type} model_type	model type
	 * @param {string} model_path		model path
	 * @return {*}
	 */
	void init(const Algo_Type algo_type, const Device_Type device_type, const Model_Type model_type, const std::string model_path);

private:
	/**
	 * @description: model pre-process
	 * @return {*}
	 */
	void pre_process();

	/**
	 * @description: model post-process
	 * @return {*}
	 */
	void post_process();
};