import glob
import shutil
import os

def moveFiles(source, destination):
	counter = 1;
	for jpgfile in glob.iglob(os.path.join(source, "*.png")):
		print("Moving image "+str(counter))
		shutil.move(jpgfile, destination)
		counter+=1

def deleteFiles(source):
	shutil.rmtree(source) 

if not os.path.exists ('Pix2Pix\\ganLimitation\\train'): 
	os.makedirs('Pix2Pix\\ganLimitation\\train')

if not os.path.exists ('Pix2Pix\\ganLimitation\\test'):
	os.makedirs('Pix2Pix\\ganLimitation\\test')

if not os.path.exists ('Pix2Pix\\ganLimitation\\val'): 
	os.makedirs('Pix2Pix\\ganLimitation\\val')


print("************ MOVING FILES FROM combined TO ganLimitation (train/test/val)")
moveFiles("Pix2Pix\\photos\\combined\\train", "Pix2Pix\\ganLimitation\\train")
moveFiles("Pix2Pix\\photos\\combined\\test", "Pix2Pix\\ganLimitation\\test")
moveFiles("Pix2Pix\\photos\\combined\\val", "Pix2Pix\\ganLimitation\\val")

if os.path.exists ('Pix2Pix\\photos\\combined\\train'): 
	deleteFiles("Pix2Pix\\photos\\combined\\train")

if os.path.exists ('Pix2Pix\\photos\\combined\\test'): 	
	deleteFiles("Pix2Pix\\photos\\combined\\test")

if os.path.exists ('Pix2Pix\\photos\\combined\\val'): 	
	deleteFiles("Pix2Pix\\photos\\combined\\val")

if os.path.exists ('Pix2Pix\\photos\\resized1'): 	
	deleteFiles('Pix2Pix\\photos\\resized1')

if not os.path.exists ('Pix2Pix\\photos\\resized1'): 	
	os.makedirs('Pix2Pix\\photos\\resized1')

if os.path.exists ('Pix2Pix\\photos\\resized2'): 	
	deleteFiles("Pix2Pix\\photos\\resized2")

if not os.path.exists ('Pix2Pix\\photos\\resized2'): 	
	os.makedirs('Pix2Pix\\photos\\resized2')