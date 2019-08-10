import cv2
import os
def resize_images(folder):
	counter = 1;
	images = []
	for filename in os.listdir(folder):
		img = cv2.imread(os.path.join(folder,filename))
		img = cv2.resize(img,(256,256))
		string = os.path.join(folder,filename)
		print("Resizing image "+str(counter));
		cv2.imwrite(string,img)
		counter+=1;

resize_images("CAPTCHA-Classifier\\train")
resize_images("CAPTCHA-Classifier\\test")
resize_images("CAPTCHA-Classifier\\val")


