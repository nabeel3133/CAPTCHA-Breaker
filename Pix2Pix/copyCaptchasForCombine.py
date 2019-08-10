import glob
import shutil
import os

def renameFiles(source):
    counter = 1;
    for pngfile in glob.iglob(os.path.join(source, "*.png")):
        if "-outputs" in pngfile:
            print("Renaming image "+str(counter))
            os.rename(pngfile, pngfile.replace("-outputs", ""))
            counter+=1
        else:
            continue

def copyTestFiles(source, destination):
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

def moveFiles(source, destination):
	counter = 1;
	for pngfile in glob.iglob(os.path.join(source, "*.png")):
		print("Moving image "+str(counter))
		shutil.move(pngfile, destination)
		counter+=1

def deleteFiles(source):
	shutil.rmtree(source) 

if os.path.exists ("Pix2Pix\\ganLimitation\\val"): 	
	deleteFiles("Pix2Pix\\ganLimitation\\val")

copyTestFiles("Pix2Pix\\ganLimitation_testBtoA\\images", "Pix2Pix\\photos\\resized1")
renameFiles("Pix2Pix\\photos\\resized1")
moveFiles("CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords", "Pix2Pix\\photos\\resized2")


