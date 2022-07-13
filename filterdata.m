%% Code to Filter raw data to a specific frequency range:

% NOTE: You must input the data from the csv file, this data will be
% named raw_time and raw_voltage

%%% Fix data and filter it %%%
time = raw_time - raw_time(1); % get rid of the offset
voltage = raw_voltage - raw_voltage(1); % get rid of the offset
fs = 4000; %sampling rate (Hz)
frequency = [50 250]; %filtering frequency range (Hz)
filteredVoltage = bandpass(voltage, frequency,fs); % bandpass filter

%%% Plot the original and filtered data %%%
figure(1)
subplot(1,2,1)
plot(time,voltage)
title('Voice Recording')
xlabel('Time (sec)')
ylabel('Voltage (V)')

subplot(1,2,2)
plot(time,filteredVoltage)
title('Voice Recording FILTERED')
xlabel('Time (sec)')
ylabel('Voltage (V)')


%% Change filtered data into a music wave signal:

Y=[time filteredVoltage];

Fs=2000;

audiowrite('voice_filtered.wav',Y,Fs)
sound(Y,Fs)






