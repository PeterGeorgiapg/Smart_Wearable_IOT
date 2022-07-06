from matplotlib.pyplot import magnitude_spectrum
import pandas as pd
import numpy as np
import matplotlib.pylab as plt
from scipy.fft import fft
import seaborn as sns
from glob import glob

import os

import librosa
import librosa.display
import IPython.display as ipd
from itertools import cycle
import noise
import PySound

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
    plt.ylim([0,2000])
    return plt
    # plt.show()



def MFCC(x,sr):
    pass

def FFT(x,sr):
    magnitude = np.abs(np.fft.fft(x))
    freqeuncy = np.linspace(0,sr,len(magnitude))
    plt.figure(figsize=(14, 5))
    plt.plot(freqeuncy,magnitude)
    plt.xlabel("Frequency")
    plt.ylabel("Magnitude")
    plt.ylim([0,2000])
    plt.title("Fourier Transform Plot")
    return plt


#use glob to read audio file
if __name__ == "__main__":
    PySound.write_to_wav("test\Music4.wav")
    os.system('export DISPLAY=:0.0')
    x, sr = librosa.load('test\Music4.wav')    #   x is audio array and sr is sample rate
    # sr = 1024
    base=base_plot(x,sr,"Noise base plot")    # Step 1
    stft_plot = stft(x,sr,"Noise STFT plot")          # Step 2
    fft_plot = FFT(x,sr)
    fft_plot.show()
    #base.show()
    try:

        stft_plot.show()
    except Exception as e:
        print(e)
    

    





