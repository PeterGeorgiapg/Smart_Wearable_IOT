myFolder = 'C:\Users\ckhar\OneDrive\Desktop\Uni Work\VIP - Smart Wearable Tech\Database\411\smart';
myFiles = fullfile(myFolder, '*.csv');
theFiles = dir(myFiles);

for i = 1:length(theFiles)
    baseFileName = theFiles(i).name;
    fullFileName = fullfile(theFiles(i).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);

    Y = csvread(fullFileName);
    time = Y(:,1);
    voltage = Y(:,2);
    
    newTime = time - time(1);
    newVoltage = voltage - voltage(1);
    fs = 8000; %sampling rate (Hz)
    frequency = [70 1000]; %filtering frequency range (Hz)
    filteredVoltage = bandpass(newVoltage, frequency,fs); % bandpass filter
    
    plot(time,filteredVoltage)
    
    Y=[time filteredVoltage];

    name = 'smart';
    filename = [name '_' num2str(i, '%d') '.wav'];
    fprintf("name: %s", filename);
   
    audiowrite(filename,Y,fs)
    sound(Y,fs)
end


