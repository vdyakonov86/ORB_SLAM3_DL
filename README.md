# Evaluation
## Evaluation ORB:
python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_sitting_xyz.txt /orbslam3_dl/ws/evaluation/fr3_sitting_xyz_orb/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_sitting_xyz_orb --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_xyz.txt /orbslam3_dl/ws/evaluation/fr3_walking_xyz_orb/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_xyz_orb --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_rpy.txt /orbslam3_dl/ws/evaluation/fr3_walking_rpy_orb/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_rpy_orb --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_static.txt /orbslam3_dl/ws/evaluation/fr3_walking_static_orb/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_static_orb --verbose 

## Evaluation SuperPoint:
python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_sitting_xyz.txt /orbslam3_dl/ws/evaluation/fr3_sitting_xyz_superpoint/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_sitting_xyz_superpoint --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_xyz.txt /orbslam3_dl/ws/evaluation/fr3_walking_xyz_superpoint/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_xyz_superpoint --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_rpy.txt /orbslam3_dl/ws/evaluation/fr3_walking_rpy_superpoint/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_rpy_superpoint --verbose 

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/evaluate_ate_scale.py /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/Ground_truth/TUM_rgbd/fr3_walking_static.txt /orbslam3_dl/ws/evaluation/fr3_walking_static_superpoint/CameraTraj.txt --save_dir=/orbslam3_dl/ws/evaluation/fr3_walking_static_superpoint --verbose 

# Association:
python3 src/python/associate.py PATH_TO_SEQUENCE/rgb.txt PATH_TO_SEQUENCE/depth.txt --outpath PATH_TO_SEQUENCE --outfile FILENAME

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz/depth.txt --outpath /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/ --outfile fr3_sitting_xyz.txt

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz/depth.txt --outpath /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/ --outfile fr3_walking_xyz.txt

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy/depth.txt --outpath /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/ --outfile fr3_walking_rpy.txt

python3 /orbslam3_dl/ws/src/ORB_SLAM3/evaluation/associate.py /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_static/rgb.txt /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_static/depth.txt --outpath /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/ --outfile fr3_walking_static.txt

# Run examples
## Stereo:
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/stereo_euroc /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/EuRoC.yaml /Datasets/EuRoC/MH01 /orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/EuRoC_TimeStamps/MH01.txt
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/stereo_kitti /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/KITTI00-02.yaml ~/Datasets/Kitti/00
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/stereo_kitti /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/Stereo/Nuance.yaml ~/Datasets/Nuance/00

## RGBD ORB:
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_sitting_xyz.txt /orbslam3_dl/ws/evaluation/fr3_sitting_xyz_orb/ ORB ORB

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_xyz.txt /orbslam3_dl/ws/evaluation/fr3_walking_xyz_orb/ ORB ORB

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_rpy.txt /orbslam3_dl/ws/evaluation/fr3_walking_rpy_orb/ ORB ORB

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_static /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_static.txt /orbslam3_dl/ws/evaluation/fr3_walking_static_orb/ ORB ORB

## RGBD SuperPoint:
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_sitting_xyz.txt /orbslam3_dl/ws/evaluation/fr3_sitting_xyz_superpoint/ SUPERPOINT SUPERPOINT 

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_xyz.txt /orbslam3_dl/ws/evaluation/fr3_walking_xyz_superpoint/ SUPERPOINT SUPERPOINT

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_rpy.txt /orbslam3_dl/ws/evaluation/fr3_walking_rpy_superpoint/ SUPERPOINT SUPERPOINT

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_static /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_static.txt /orbslam3_dl/ws/evaluation/fr3_walking_static_superpoint/ SUPERPOINT SUPERPOINT

## RGBD SuperPoint+SuperGlue:
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_sitting_xyz.txt /orbslam3_dl/ws/evaluation/fr3_sitting_xyz_superpoint/ SUPERPOINT SUPERGLUE 

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_xyz.txt /orbslam3_dl/ws/evaluation/fr3_walking_xyz_superpoint/ SUPERPOINT SUPERGLUE

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_rpy.txt /orbslam3_dl/ws/evaluation/fr3_walking_rpy_superpoint/ SUPERPOINT SUPERGLUE

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM_superpoint.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_static /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_static.txt /orbslam3_dl/ws/evaluation/fr3_walking_static_superpoint/ SUPERPOINT SUPERGLUE

## RGBD with yolo:
/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum_yolo /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_sitting_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_sitting_xyz.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_sitting_xyz

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum_yolo /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_xyz /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_xyz.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_walking_xyz

/orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/rgbd_tum_yolo /orbslam3_dl/ws/src/ORB_SLAM3/Vocabulary/ORBvoc.txt /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/TUM1.yaml /orbslam3_dl/datasets/TUM/rgbd_dataset_freiburg3_walking_rpy /orbslam3_dl/ws/src/ORB_SLAM3/Examples/RGB-D/associations/fr3_walking_rpy.txt 2 2 6 0 0 /orbslam3_dl/ws/src/yolo-inference/weights/yolov11n_seg_fp32.onnx fr3_walking_rpy
