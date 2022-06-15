import pandas as pd
import numpy as np
import matplotlib.pylab as plt
import seaborn as sns
from glob import glob

import os

import librosa
import librosa.display
import IPython.display as ipd
from itertools import cycle

sns.set_theme(style = "white",palette = None)
color_pal = plt.rcParams["axes.prop_cycle"].by_key()["color"]
color_cycle = cycle(plt.rcParams["axes.prop_cycle"].by_key()["color"])

def base_plot(x,sr,title):
    plt.figure(figsize=(14, 5))
    librosa.display.waveshow(x, sr=sr)
    plt.title(title)
    return plt
    # plt.show()

def stft(x,sr,title):
    X = librosa.stft(x)
    Xdb = librosa.amplitude_to_db(abs(X))
    plt.figure(figsize=(14, 5))
    librosa.display.specshow(Xdb, sr=sr, x_axis='time', y_axis='hz')
    plt.title(title)
    return plt
    # plt.show()


def MFCC(x,sr):
    pass

def FFT(x,sr):
    pass


#use glob to read audio file
if __name__ == "__main__":

    os.system('export DISPLAY=:0.0')
    x, sr = librosa.load('test_data/Lab1_purenoise.wav')    #   x is audio array and sr is sample rate
    # print(x.shape)
    # print(sr)
    sr = 2000
    base=base_plot(x,sr,"Noise base plot")    # Step 1
    stft_plot = stft(x,sr,"Noise STFT plot")          # Step 2
    base.show()
    stft_plot.show()

    





