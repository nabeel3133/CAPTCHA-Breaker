echo before
"C:\Program Files\MATLAB\R2018a\bin\matlab.exe" -nodisplay -nosplash -nodesktop -r -wait "run('CAPTCHA-Generator\code\generateAlphabetDataset.m');"
echo after

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Generator\code\copyImages.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\tools\process.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\tools\split.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\photos\copyDataset.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\pix2pix-trainBtoA.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Generator\Images\SimpleText\generate5LetterWordsImages.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\tools\process.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\photos\copyCombineToVal.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\pix2pix-testBtoA.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\copyCaptchasForCombine.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\tools\process.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\tools\split.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\photos\copyDataset.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\pix2pix-trainAtoB.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\pix2pix-testAtoB.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "Pix2Pix\copyDatasetToClassifier.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Classifier\split.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Classifier\resize_dataset.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Classifier\simple_CNN\captcha_cnn.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Classifier\simple_CNN\restore_captcha_cnn.py" 
pause

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe" "CAPTCHA-Classifier\delete_datasets.py" 
pause