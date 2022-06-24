

import pandas as pd
import soundfile as sf

# assume we have columns 'time' and 'value'
df = pd.read_csv('Music4.csv')

# compute sample rate, assuming times are in seconds
times = df['time'].values
n_measurements = len(times)
timespan_seconds = times[-1] - times[0]
sample_rate_hz = int(n_measurements / timespan_seconds)

# write data
data = df['value'].values
sf.write('Music4.wav', data, sample_rate_hz)