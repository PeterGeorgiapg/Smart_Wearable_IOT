s = daq.createSession('digilent')
dq = daq("digilent")
ch_in = addinput(dq, "AD1", "1", "Voltage");

ch_in.Name = "AD1_1_in"
rate = 600e3;
dq.Rate = rate;
ch_in.Range = [-2.5 2.5];

[singleReading, startTime] = read(dq)
[data, startTime] = read(dq, seconds(10));

plot(data.Time, data.AD1_1_in);
xlabel('Time (s)');
ylabel('Voltage (V)');
title(['Clocked Data Triggered on: ' datestr(startTime)]);

clear;
% Start and run script same time as starting music. 