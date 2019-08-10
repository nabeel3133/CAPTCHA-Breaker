# CAPTCHA-Breaker
This repository contains the pipeline for breaking a CAPTCHA using python and deep learning. The pipeline has the following 3 modules:
1) CAPTCHA-Generator is used to generate a limited dataset of text-based CAPTCHAs and there are different variations to choose from.
2) Pix2Pix is a GAN (Generative Adversarial Network) which is used to generate more of the selected variation of text-based CAPTCHAs.
3) CAPTCHA-Classifier is a CNN (Convolutional Neural Network) which is used to recognize the characters contained in the text-based CAPTCHA.

## Prerequisites
- Tensorflow 1.4.1
- Python 3.x
- OpenCV

## How to run
- Download the [datasets](https://drive.google.com/open?id=1apPR2mOzGvuu0u8mxooBY0LkCTaLdFFX) and extract them in the "CAPTCHA-Generator\Images" folder to be able to generate different variety of text-based CAPTCHAs having different background and textured alphabets.
- Open the 'CAPTCHA-Breaker.bat' file and you are good to go.
