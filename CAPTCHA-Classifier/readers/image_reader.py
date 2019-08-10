from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import numpy as np
from scipy.misc import imread
import label_util
import tensorflow as tf
import sys

# IMAGE_WIDTH = 128
# IMAGE_HEIGHT = 128

# IMAGE_WIDTH = 152
# IMAGE_HEIGHT = 80

IMAGE_WIDTH = 256
IMAGE_HEIGHT = 256

CAPTCHA_LENGTH = 5

# Global constants describing the captcha data set.
NUM_CLASSES = 26
NUM_EXAMPLES_PER_EPOCH_FOR_TRAIN = 32   #1000
NUM_EXAMPLES_PER_EPOCH_FOR_EVAL = 32   #100
training_folder = "CAPTCHA-Classifier\\train\\"
testing_folder = "CAPTCHA-Classifier\\test\\"


def load_training_dataset():
    no_files = len(os.listdir(training_folder))
    return load_dataset(training_folder, 0, no_files)

def load_testing_dataset():
    no_files = len(os.listdir(testing_folder))
    return load_dataset(testing_folder, 0, no_files)

def load_demo_dataset(folder):
    no_files = len(os.listdir(folder))
    return load_dataset(folder, 0, no_files)

def normalize_data(X):
    x_mean = X.mean(axis=0)
    x_std = X.std(axis=0)
    X = (X - x_mean) / (x_std + 0.00001)
    return X
    
def training_dataset_length():
    return len(os.listdir(training_folder))


def load_dataset(folder, fromPos, toPos):
    file_list = os.listdir(folder)
    X = np.zeros([toPos - fromPos, IMAGE_HEIGHT * IMAGE_WIDTH])
    # print(X.shape)
    Y = np.zeros([toPos - fromPos, 5 * NUM_CLASSES])
    # print(Y.shape)
    for i, filename in enumerate(file_list[fromPos:toPos]):
        path = folder + filename
        img = imread(path, flatten=True)
        captcha_text = filename[0:CAPTCHA_LENGTH]
        # print(captcha_text)
        X[i, :] = img.flatten()
        Y[i, :] = label_util.words_to_vec(captcha_text)
        # sys.exit()
    X = normalize_data(X)
    return X, Y


def tf_load_dataset(folder):
    filename_queue = tf.train.string_input_producer(
        tf.train.match_filenames_once(folder + "/*.png"))

    image_reader = tf.WholeFileReader()
    _, image_file = image_reader.read(filename_queue)
    image = tf.image.decode_jpeg(image_file)

    Y = np.zeros([len(filename_queue), 5 * NUM_CLASSES])
