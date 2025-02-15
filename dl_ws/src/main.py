from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
import os
from ultralytics import YOLO

path_to_data = "/Datasets/EuRoC/MH01/mav0/cam0/data/"
images_paths = []

for image_filename in sorted(os.listdir(path_to_data)):
  path = f'{path_to_data}{image_filename}'
  images_paths.append(path)

# image = plt.imread(images_paths[0])

img = Image.open(f'{images_paths[0]}')
img_shape = (img.width, img.height)
print(img_shape)
plt.imshow(img, cmap='gray')

plt.plot([1,2], [3,4])
plt.show()

pwd = os.path.dirname(os.path.realpath(__file__))
print(pwd)
model_trained = YOLO(f'{pwd}/../models/best.pt')
results = model_trained(path_to_data, stream=True)  # return a list of Results objects

for result in results:
  boxes = result.boxes  # Boxes object for bounding box outputs
  masks = result.masks  # Masks object for segmentation masks outputs
  keypoints = result.keypoints  # Keypoints object for pose outputs
  probs = result.probs  # Probs object for classification outputs
  obb = result.obb  # Oriented boxes object for OBB outputs
  result.show()  # display to screen
  # result.save(filename="result.jpg")  # save to disk