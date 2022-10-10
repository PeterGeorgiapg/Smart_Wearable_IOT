% Get folder for developement of csv files
myFolder = "C:\Users\Young\Desktop\Smart_Wearable_IOT\Data_Set_Training\Hello";
myFiles = fullfile(myFolder, '*.csv');
theFiles = dir(myFiles);

% Check for highest indexed wav file
% This is to make sure the write file will not overwrite existing files
myExistingFiles = fullfile(myFolder, '*.wav');
theExistingFiles = dir(myExistingFiles);
minumin = 0;
if isempty(theExistingFiles) == false 
    minumin = length(theExistingFiles);
end
fprintf("%d", minumin);

for i = 1:length(theFiles)
    baseFileName = theFiles(i).name;
    fullFileName = fullfile(theFiles(i).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    
    % Reads in the csv values
    Y = csvread(fullFileName);
    time = Y(:,1);
    voltage = Y(:,2);
    
    % Bandpass section
    newTime = time - time(1);
    newVoltage = voltage - voltage(1);
    fs = 8000; %sampling rate (Hz)
    frequency = [70 1000]; %filtering frequency range (Hz)
    filteredVoltage = bandpass(newVoltage, frequency,fs); % bandpass filter
    
    plot(time,filteredVoltage)
    
    Y=[time filteredVoltage];
    
    % Creates wav. file
    name = 'hello';
    filename = [name '_' num2str(i + minumin, '%d') '.wav'];
    fprintf("name: %s", filename);
   
    audiowrite(filename,Y,fs)
    sound(Y,fs)

    
end

% Deletes all csv files that have been converted
delete *.csv

