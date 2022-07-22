%% FFT For Sensors 

clf(figure(1))
% Common things
Fs = 4000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 8000;             % Length of signal

Y_acc = csvread("presentation_accelerometer.csv");
time_acc = Y_acc(:,1);
voltage_acc = Y_acc(:,2);
Y_zz = csvread("presentation_sensor_zigzag.csv");
time_zigzag = Y_zz(:,1);
voltage_zigzag = Y_zz(:,2);
Y_str = csvread("presentation_sensor_straight.csv");
time_str= Y_str(:,1);
voltage_str = Y_str(:,2);
%% Accelerometer
t = time_acc;
X = voltage_acc;
Y_acc = fft(X);
P2_acc = abs(Y_acc/L);
P1_acc = P2_acc(1:L/2+1);
P1_acc(2:end-1) = 2*P1_acc(2:end-1);
f_acc = Fs*(0:(L/2))/L;

%% ZigZag
t = time_zigzag;
X = voltage_zigzag;
Y_zz = fft(X);
P2_zz = abs(Y_zz/L);
P1_zz = P2_zz(1:L/2+1);
P1_zz(2:end-1) = 2*P1_zz(2:end-1);
f_zz = Fs*(0:(L/2))/L;

%% Straight
t = time_str;
X = voltage_str;
Y_str = fft(X);
P2_str = abs(Y_str/L);
P1_str = P2_str(1:L/2+1);
P1_str(2:end-1) = 2*P1_str(2:end-1);
f_str = Fs*(0:(L/2))/L;


figure(1)
hold on 
ylim([0,3.5e-3])
xlim([0,750])
plot(f_str,P1_str,'m')
plot(f_zz,P1_zz, 'b')
plot(f_acc,P1_acc,'g')
plot(f_mic,P1_mic,'k')
legend('Straight Stitch', 'ZigZag Stitch', 'Accelerometer', 'Microphone')
title('Single-Sided fft of signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
hold off


