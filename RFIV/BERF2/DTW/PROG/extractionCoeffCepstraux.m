function coeffCepstraux = extractionCoeffCepstraux(audioIn)
% version 3
% - vérification du nb de voix et fréquence
% - utilisation fenetrage de hamming
% version 4
% - réduction à 32 parametres

[y, freqEch, nbits, opts] = wavread(audioIn);

if (opts.fmt.nSamplesPerSec ~= 16000)
    disp('Attention : vous ne travaillez pas avec des fichiers enregistres a 16000 Hz')
    disp(['frequence de votre fichier : ' num2str(opts.fmt.nSamplesPerSec) ' Hz).' ] );
end


if (opts.fmt.nChannels ~= 1)
    error('Erreur : vous ne travaillez pas avec des fichiers mono.');
end

coeffCepstraux=melcepst(y,freqEch);
coeffCepstraux=coeffCepstraux';
