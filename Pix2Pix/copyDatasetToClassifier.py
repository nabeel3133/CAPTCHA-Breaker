import glob
import shutil
import os

def copyTestFiles(source, destination):
	counter = 1;
	for jpgfile in glob.iglob(os.path.join(source, "*.png")):
		if "-inputs" in jpgfile:
			continue
		elif "-targets" in jpgfile:
			continue
		else:
			print("Copying image "+str(counter))
			shutil.copy(jpgfile, destination)
			counter+=1

def deleteFiles(source):
	shutil.rmtree(source) 

if not os.path.exists ('CAPTCHA-Classifier\\train'): 
	os.makedirs('CAPTCHA-Classifier\\train')

if not os.path.exists ('CAPTCHA-Classifier\\test'):
	os.makedirs('CAPTCHA-Classifier\\test')

if not os.path.exists ('CAPTCHA-Classifier\\val'): 
	os.makedirs('CAPTCHA-Classifier\\val')

copyTestFiles("Pix2Pix\\ganLimitation_testAtoB\\images", "CAPTCHA-Classifier\\dataset")
deleteFiles("Pix2Pix\\ganLimitation")
deleteFiles("Pix2Pix\\ganLimitation_trainAtoB")
deleteFiles("Pix2Pix\\ganLimitation_trainBtoA")
deleteFiles("Pix2Pix\\ganLimitation_testAtoB")
deleteFiles("Pix2Pix\\ganLimitation_testBtoA")
os.makedirs("Pix2Pix\\ganLimitation")
os.makedirs("Pix2Pix\\ganLimitation_trainAtoB")
os.makedirs("Pix2Pix\\ganLimitation_trainBtoA")
os.makedirs("Pix2Pix\\ganLimitation_testAtoB")
os.makedirs("Pix2Pix\\ganLimitation_testBtoA")


