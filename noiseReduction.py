import struct
import wave
import IPython
from scipy.io import wavfile
import scipy.signal
import numpy as np
import matplotlib.pyplot as plt
import librosa
from scipy import fftpack
from scipy.io import wavfile
#%matplotlib inline


# Constant
SAMPLE = 1024
SAMPLERATE = 1

# Helper Function

def fftnoise(f):
    f = np.array(f, dtype="complex")
    Np = (len(f) - 1) // 2
    phases = np.random.rand(Np) * 2 * np.pi
    phases = np.cos(phases) + 1j * np.sin(phases)
    f[1 : Np + 1] *= phases
    f[-1 : -1 - Np : -1] = np.conj(f[1 : Np + 1])
    return np.fft.ifft(f).real


def band_limited_noise(min_freq, max_freq, samples=1024, samplerate=1):
    freqs = np.abs(np.fft.fftfreq(samples, 1 / samplerate))
    f = np.zeros(samples)
    f[np.logical_and(freqs >= min_freq, freqs <= max_freq)] = 1
    return fftnoise(f)




if __name__ == "__main__":
    # print(wavfile.read("IMG_2530.wav"))
    wav_file = wave.open("IMG_2530.wav", 'rb')
    # wav_file = wav_file.setchannels(1)
    nchannels, sampwidth, framerate, nframes, comptype, compname = wav_file.getparams()
    # print(nframes)
    print(wav_file.getparams())


    frames_wave = wav_file.readframes(nframes)
    print(len(frames_wave))
    wav_file.close()

    # print(frames_wave)

    # print("Length:", nframes)

    # # Deserializing
    # frames_wave = struct.unpack('{n}h'.format(n=nframes*2), frames_wave)
    # frames_wave = np.array(frames_wave)
    # print("Min value:", np.min(frames_wave), "Max value:", np.max(frames_wave))
    # print(frames_wave)
