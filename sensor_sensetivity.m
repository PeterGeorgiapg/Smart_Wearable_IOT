Y = xlsread("Shaker_Data.xlsx");
frequency = Y(:,1);
Vpp = Y(:,2);
Vpp_laser = Y(:,3)*10^-3;
l = length(frequency);

for i = 1:l
    vel = Vpp_laser*50*10^-3; % gives velocity in m/s
    omega = 2*pi*frequency(i); 
    acc = vel*omega;
end

sensitivity = (Vpp*10^-3)/acc;

figure(1)
plot(frequency,Vpp)
title("Input Frequency vs Vpp for ZigZag Triboelectric Sensor")
ylabel("Vpp (mV)")
xlabel("Frequency (Hz)")

figure(2)
plot(frequency,acc)
title("Input Frequency vs acceleration")
ylabel("Acceleration (m/s^2)")
xlabel("Frequency (Hz)")

figure(3)
plot(frequency,sensitivity)
title("Sensitivity for ZigZag Triboelectric Sensor")
ylabel("Vpp/Acceleration Vs^2/m")
xlabel("Frequency (Hz)")







