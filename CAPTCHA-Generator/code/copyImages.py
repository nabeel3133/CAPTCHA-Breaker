import glob
import shutil
import os

def moveFiles(source, destination):
	counter = 1;
	for jpgfile in glob.iglob(os.path.join(source, "*.png")):
		print("Moving image "+str(counter))
		shutil.move(jpgfile, destination)
		counter+=1

def copyFiles(source, destination):
	counter = 1;
	for jpgfile in glob.iglob(os.path.join(source, "*.png")):
		print("Copying image "+str(counter))
		shutil.move(jpgfile, destination)
		counter+=1
		
if not os.path.exists ('CAPTCHA-Classifier\\dataset'): 
	os.makedirs('CAPTCHA-Classifier\\dataset')

if not os.path.exists ('Pix2Pix\\photos\\combined'): 
	os.makedirs('Pix2Pix\\photos\\combined')

if not os.path.exists ('Pix2Pix\\photos\\resized1'): 
	os.makedirs('Pix2Pix\\photos\\resized1')

if not os.path.exists ('Pix2Pix\\photos\\resized2'): 
	os.makedirs('Pix2Pix\\photos\\resized2')

moveFiles("CAPTCHA-Generator\\pix2pix\\Day", "Pix2Pix\\photos\\resized1")
moveFiles("CAPTCHA-Generator\\pix2pix\\Night", "Pix2Pix\\photos\\resized2")

