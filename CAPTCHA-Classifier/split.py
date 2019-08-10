import random
import shutil
import argparse
import glob
import os

def renameFiles(source):
    counter = 1;
    for jpgfile in glob.iglob(os.path.join(source, "*.png")):
        if "-outputs" in jpgfile:
            print("Renaming image "+str(counter))
            os.rename(jpgfile, jpgfile.replace("-outputs", ""))
            counter+=1
        else:
            continue


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
        shutil.copy(jpgfile, destination)
        counter+=1

def splitting():
    random.seed(0)
    directory = "CAPTCHA-Classifier\\dataset" 
    files = glob.glob(os.path.join(directory, "*.png"))
    files.sort()

    assignments = []
    assignments.extend(["train"] * int(0.7 * len(files)))
    assignments.extend(["test"] * int(0.2 * len(files)))
    assignments.extend(["val"] * int(len(files) - len(assignments)))

    random.shuffle(assignments)

    for name in ["train", "val", "test"]:
        if name in assignments:
            d = os.path.join(directory, name)
            if not os.path.exists(d):
                os.makedirs(d)

    print(len(files), len(assignments))
    for inpath, assignment in zip(files, assignments):
        outpath = os.path.join(directory, assignment, os.path.basename(inpath))
        print(inpath, "->", outpath)
        os.rename(inpath, outpath)

renameFiles("CAPTCHA-Classifier\\dataset")
splitting()

if not os.path.exists ('CAPTCHA-Classifier\\train'): 
    os.makedirs('CAPTCHA-Classifier\\train')

if not os.path.exists ('CAPTCHA-Classifier\\test'):
    os.makedirs('CAPTCHA-Classifier\\test')

if not os.path.exists ('CAPTCHA-Classifier\\val'): 
    os.makedirs('CAPTCHA-Classifier\\val')

moveFiles("CAPTCHA-Classifier\\dataset\\train", "CAPTCHA-Classifier\\train")
moveFiles("CAPTCHA-Classifier\\dataset\\test", "CAPTCHA-Classifier\\test")
moveFiles("CAPTCHA-Classifier\\dataset\\val", "CAPTCHA-Classifier\\val")