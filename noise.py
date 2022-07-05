import pandas as pd
import numpy as np
import matplotlib.pylab as plt
import seaborn as sns
from glob import glob

import os
from itertools import cycle
import sounddevice as sd
from scipy import signal

from constant import *



def bandpass_filter(fs,signal):
    
    nyq = 0.5*fs
    low = LOW_CUT/nyq
    high = HIGH_CUT/nyq

    order = 2  #    Need to find what this order means

    b,a = signal.butter(order,[low,high],'bandpass',analog = False)
    y = signal.filtfilt(b,a,signal,axis = 0)

    return y


def low_band():
    pass