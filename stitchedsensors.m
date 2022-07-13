%% Code to Filter raw data to a specific frequency range:

%%% Fix data and filter it %%%
zigzagtime = zigzag_time - zigzag_time(1);
zigzagvoltage = zigzag_voltage + zigzag_voltage(1);
straighttime = straight_time - straight_time(1);
straightvoltage = straight_voltage + straight_voltage(1);
fs = 4000; %sampling rate (Hz)
frequency1 = [60 250];
frequency2 = [60 250]; %filtering frequency range (Hz)
zigzag_filteredVoltage = bandpass(zigzagvoltage, frequency1,fs);
straight_filteredVoltage = bandpass(straightvoltage, frequency2,fs);



%%% Plot the original and filtered data %%%
figure(1)
subplot(2,2,1)
plot(zigzagtime,zigzagvoltage)
title('ZigZag Stitch Original')
xlabel('Time (sec)')
ylabel('Voltage (V)')

subplot(2,2,2)
plot(zigzagtime,zigzag_filteredVoltage)
title('ZigZag Stitch FILTERED')
xlabel('Time (sec)')
ylabel('Voltage (V)')

figure(1)
subplot(2,2,3)
plot(straighttime,straightvoltage)
title('Straight Stitch Original')
xlabel('Time (sec)')
ylabel('Voltage (V)')

subplot(2,2,4)
plot(straighttime,straight_filteredVoltage)
title('Straight Stitch FILTERED')
xlabel('Time (sec)')
ylabel('Voltage (V)')



%% Change filtered data into a music wave signal:

Y=[zigzagtime, zigzag_filteredVoltage];
X = [straighttime, straight_filteredVoltage];

Fs=4000;


audiowrite('zigzag.wav',Y,Fs)
audiowrite('straight.wav',X,Fs)
sound(Y,Fs)
sound(X,Fs)






