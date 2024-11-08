clc;
clear all;
close all;


while true
    choice = input('Enter 1:BPSK, 2:QPSK, 3:MSK, 4:16-QAM, 5:M-PSK, 6:Orthogonal M-FSK, 0:Exit : ');
   
    if choice == 0
        break;
    end
   
    SNR = input('Enter Eb/N0 ratio (bit energy to noise power spectral density in dB): ');


    % Check if M is needed for the modulation type
    if choice > 4
        M = input('Enter number of symbols in integer power of 2 (e.g., 2, 4, 8, 16, 32, ...): ');
    end


    % Initialize probability of error variable
    pe = NaN;


    % BPSK (choice 1)
    if choice == 1
        pe = 0.5 * erfc(sqrt(SNR));


    % QPSK (choice 2)
    elseif choice == 2
        pe = 0.5 * erfc(sqrt(SNR));


    % MSK (choice 3)
    elseif choice == 3
        pe = 0.5 * erfc(sqrt(SNR / 2));


    % 16-QAM (choice 4)
    elseif choice == 4
        pe = 0.5 * erfc(sqrt((pi^2 * SNR) / 16));


    % M-PSK (choice 5)
    elseif choice == 5
        N = log2(M);  % Number of bits per symbol
        pe = erfc(sqrt(N * SNR) * sin(pi / M));


    % Orthogonal M-FSK (choice 6)
    elseif choice == 6
        N = log2(M);  % Number of bits per symbol
        pe = ((M - 1) / 2) * erfc(sqrt(N * SNR / 2));


    else
        disp("Invalid Choice. Please try again.");
        continue;
    end
   
    % Display the probability of error
    disp(['The probability of error (Pe) is: ', num2str(pe)]);
    disp(' ')
end
