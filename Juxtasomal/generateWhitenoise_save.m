% Sampling parameters
duration = 0.1; % 10 sec in seconds
fs = 192000; % Sampling frequency in Hz (400 kHz)
num_samples = duration * fs;

% Generate white noise
white_noise = randn(num_samples, 1);

% Normalize to -3 dBFS
max_amplitude = max(abs(white_noise));
normalized_noise = white_noise / max_amplitude * 0.707;

% Save as WAV file
filename = 'white_noise_c57bl6j_mice_ultrasound_192kHz_100ms.wav';
audiowrite(filename, normalized_noise, fs);

disp('White noise file generated and saved successfully.');