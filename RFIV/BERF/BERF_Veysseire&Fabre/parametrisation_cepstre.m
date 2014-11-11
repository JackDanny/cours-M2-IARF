function parametres = parametrisation_cepstre(signal)

%fen = hamming(length(signal));

% Calcul de la TF du sinal (partie reelle)
%r_fft_signal = fft(signal,64);

%r_cepstre_signal = abs(ifft(log(r_fft_signal),64));


fen = hamming(length(signal));

% Calcul de la TF du sinal (partie reelle)
fft_signal = abs(fft(signal,128));

%parametres =  r_fft_signal(1:64);     



parametres = real(ifft(log( fft_signal(1:32) ),64 ));

parametres = parametres(1:32);

                                         
