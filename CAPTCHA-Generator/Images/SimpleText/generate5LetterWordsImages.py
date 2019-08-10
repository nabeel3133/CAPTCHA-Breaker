import cv2
import numpy as np
import os
import shutil
import glob
import sys

imagesToGenerate = 0;

def deleteFiles(source):
	shutil.rmtree(source) 

def moveFiles(source, destination):
	counter = 1;
	for pngfile in glob.iglob(os.path.join(source, "*.png")):
		print("Moving image "+str(counter))
		shutil.move(pngfile, destination)
		counter+=1

def copyFiles(source, destination):
	counter = 1;
	for pngfile in glob.iglob(os.path.join(source, "*.png")):
		print("Copying image "+str(counter))
		shutil.copy(pngfile, destination)
		counter+=1

def generateWordsImages(noOfImages):
	f = open("CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords.txt", "r")
	extension = '.png'
	counter = 1

	for x in f:
		fiveLetterWord = str(x[0])+str(x[1])+str(x[2])+str(x[3])+str(x[4])
		fiveLetterWordWithExt = fiveLetterWord + extension

		alphabet_1 = cv2.imread('CAPTCHA-Generator\\Images\\SimpleText\\Alphabets\\'+str(x[0])+'.jpg')
		alphabet_1 = cv2.resize(alphabet_1, (256, 256))

		alphabet_2 = cv2.imread('CAPTCHA-Generator\\Images\\SimpleText\\Alphabets\\'+str(x[1])+'.jpg')
		alphabet_2 = cv2.resize(alphabet_2, (256, 256))

		alphabet_3 = cv2.imread('CAPTCHA-Generator\\Images\\SimpleText\\Alphabets\\'+str(x[2])+'.jpg')
		alphabet_3 = cv2.resize(alphabet_3, (256, 256))

		alphabet_4 = cv2.imread('CAPTCHA-Generator\\Images\\SimpleText\\Alphabets\\'+str(x[3])+'.jpg')
		alphabet_4 = cv2.resize(alphabet_4, (256, 256))

		alphabet_5 = cv2.imread('CAPTCHA-Generator\\Images\\SimpleText\\Alphabets\\'+str(x[4])+'.jpg')
		alphabet_5 = cv2.resize(alphabet_5, (256, 256))

		alphabet_12 = np.concatenate((alphabet_1, alphabet_2), axis=1)
		alphabet_123 = np.concatenate((alphabet_12, alphabet_3), axis=1)
		alphabet_1234 = np.concatenate((alphabet_123, alphabet_4), axis=1)
		alphabet_12345 = np.concatenate((alphabet_1234, alphabet_5), axis=1)
		alphabet_12345 = cv2.resize(alphabet_12345, (256, 256))

		print("Generating image "+str(counter))
		cv2.imwrite('CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords\\'+fiveLetterWordWithExt, alphabet_12345)
		counter = counter + 1;

		if(counter > noOfImages):
			break;

	f.close()

if not os.path.exists ('CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords'): 
	os.makedirs('CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords')

if os.path.exists ("Pix2Pix\\ganLimitation\\train"): 
	deleteFiles("Pix2Pix\\ganLimitation\\train")

if os.path.exists ("Pix2Pix\\ganLimitation\\test"): 
	deleteFiles("Pix2Pix\\ganLimitation\\test")

if os.path.exists ("Pix2Pix\\ganLimitation\\val"): 
	deleteFiles("Pix2Pix\\ganLimitation\\val")

imagesToGenerate = int(input("How many more images you want GAN to generate: "))

generateWordsImages(imagesToGenerate)

if not os.path.exists ("Pix2Pix\\ganLimitation\\val"): 
	os.makedirs("Pix2Pix\\ganLimitation\\val")

if not os.path.exists ("Pix2Pix\\ganLimitation\\train"): 
	os.makedirs("Pix2Pix\\ganLimitation\\train")

if not os.path.exists ("Pix2Pix\\ganLimitation\\test"): 
	os.makedirs("Pix2Pix\\ganLimitation\\test")

copyFiles("CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords", "Pix2Pix\\photos\\resized1")
copyFiles("CAPTCHA-Generator\\Images\\SimpleText\\5LetterWords", "Pix2Pix\\photos\\resized2")
