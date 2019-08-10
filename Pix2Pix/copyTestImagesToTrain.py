import glob
import shutil
import os

def copyFiles(source, destination):
	counter = 1;
	for pngfile in glob.iglob(os.path.join(source, "*.png")):
		if "-inputs" in pngfile:
			continue
		elif "-targets" in pngfile:
			continue
		else:
			print("Copying image "+str(counter))
			shutil.copy(pngfile, destination)
			counter+=1

def deleteFiles(source):
	shutil.rmtree(source) 



# deleteFiles("Pix2Pix\\ganLimitation")

# if not os.path.exists ('Pix2Pix\\ganLimitation'): 
# 	os.makedirs('Pix2Pix\\ganLimitation')

# if not os.path.exists ('Pix2Pix\\ganLimitation\\train'):
# 	os.makedirs('CAPTCHA-Classifier\\test')

# if not os.path.exists ('CAPTCHA-Classifier\\val'): 
# 	os.makedirs('CAPTCHA-Classifier\\val')


copyFiles("Pix2Pix\\ganLimitation_testBtoA\\images", "Pix2Pix\\photos\\resized1")
# deleteFiles("Pix2Pix\\ganLimitation_trainAtoB")
# deleteFiles("Pix2Pix\\ganLimitation_trainBtoA")
# deleteFiles("Pix2Pix\\ganLimitation_testAtoB")
# deleteFiles("Pix2Pix\\ganLimitation_testBtoA")
# os.makedirs("Pix2Pix\\ganLimitation")
# os.makedirs("Pix2Pix\\ganLimitation_trainAtoB")
# os.makedirs("Pix2Pix\\ganLimitation_trainBtoA")
# os.makedirs("Pix2Pix\\ganLimitation_testAtoB")
# os.makedirs("Pix2Pix\\ganLimitation_testBtoA")


