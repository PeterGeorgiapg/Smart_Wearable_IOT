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

def base_plot(x,sr):
    plt.figure(figsize=(14, 5))
    librosa.display.waveshow(x, sr=sr)

    # plt.title("Example 1, time vs audio plot")
    # librosa.display.waveshow(x,sr,x_axis = "time",y_xais = "amplitude")
    plt.show()

def stft(x,sr):
    X = librosa.stft(x)
    Xdb = librosa.amplitude_to_db(abs(X))
    plt.figure(figsize=(14, 5))
    librosa.display.specshow(Xdb, sr=sr, x_axis='time', y_axis='hz')
    plt.title("Short Term Forier Transform Graph")
    plt.show()


def MFCC(x,sr):
    pass


#use glob to read audio file
if __name__ == "__main__":

    os.system('export DISPLAY=:0.0')
    x, sr = librosa.load('audio_name.wav')    #   x is audio array and sr is sample rate
    print(x.shape)
    print(sr)


    base_plot(x,sr)    # Step 1
    stft(x,sr)          # Step 2



