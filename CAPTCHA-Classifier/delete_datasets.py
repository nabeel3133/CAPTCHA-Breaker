import shutil

def deleteFiles(source):
	shutil.rmtree(source) 

if os.path.exists ("CAPTCHA-Classifier\\dataset"): 	
	deleteFiles("CAPTCHA-Classifier\\dataset")

if os.path.exists ("CAPTCHA-Classifier\\train"): 	
	deleteFiles("CAPTCHA-Classifier\\train")

if os.path.exists ("CAPTCHA-Classifier\\test"): 	
	deleteFiles("CAPTCHA-Classifier\\test")

if os.path.exists ("CAPTCHA-Classifier\\val"): 	
	deleteFiles("CAPTCHA-Classifier\\val")