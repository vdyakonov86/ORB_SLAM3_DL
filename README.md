Evaluation:
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/TUM_rgbd/fr3_sitting_xyz.txt /orbslam3_dl/ws/src/ORB_SLAM3/CameraTraj_fr3_sitting_xyz.txt --plot=true --verbose

python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/TUM_rgbd/fr3_walking_xyz.txt /orbslam3_dl/ws/src/ORB_SLAM3/CameraTraj_fr3_walking_xyz.txt --plot=true --verbose

python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/TUM_rgbd/fr3_walking_rpy.txt /orbslam3_dl/ws/src/ORB_SLAM3/CameraTraj_fr3_walking_rpy.txt --plot=true --verbose

Association:
python src/python/associate.py PATH_TO_SEQUENCE/rgb.txt PATH_TO_SEQUENCE/depth.txt --outpath PATH_TO_SEQUENCE --outfile FILENAME

python evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz/depth.txt --outpath ./Examples/RGB-D/associations/ --outfile fr3_sitting_xyz.txt

python evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz/depth.txt --outpath ./Examples/RGB-D/associations/ --outfile fr3_walking_xyz.txt

python evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy/depth.txt --outpath ./Examples/RGB-D/associations/ --outfile fr3_walking_rpy.txt

Run examples
Stereo:
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml /Datasets/EuRoC/MH01 ./Examples/Stereo/EuRoC_TimeStamps/MH01.txt
./Examples/Stereo/stereo_kitti ./Vocabulary/ORBvoc.txt ./Examples/Stereo/KITTI00-02.yaml ~/Datasets/Kitti/00
./Examples/Stereo/stereo_kitti ./Vocabulary/ORBvoc.txt ./Examples/Stereo/Nuance.yaml ~/Datasets/Nuance/00

RGBD:
./Examples/RGB-D/rgbd_tum ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz ./Examples/RGB-D/associations/fr3_sitting_xyz.txt fr3_sitting_xyz

./Examples/RGB-D/rgbd_tum ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz ./Examples/RGB-D/associations/fr3_walking_xyz.txt fr3_walking_xyz

./Examples/RGB-D/rgbd_tum ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy ./Examples/RGB-D/associations/fr3_walking_rpy.txt fr3_walking_rpy

RGBD with yolo:
./Examples/RGB-D/rgbd_tum_yolo ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz ./Examples/RGB-D/associations/fr3_sitting_xyz.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_sitting_xyz

./Examples/RGB-D/rgbd_tum_yolo ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz ./Examples/RGB-D/associations/fr3_walking_xyz.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_walking_xyz

./Examples/RGB-D/rgbd_tum_yolo ./Vocabulary/ORBvoc.txt ./Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy ./Examples/RGB-D/associations/fr3_walking_rpy.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_walking_rpy
