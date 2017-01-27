function outsig = time_stereo(insig,alpha)
%TIME_STEREO pans a signal based on interaural time differences
%
%   Usage: outsig = time_stereo(insig,alpha)
%
%   Input parameters:
%       insig - monoral signal
%       alpha - desired panning direction / deg
%
%   Output parameters:
%       outsig - two-channel stereo signal

fs = 44100;     % sampling rate / Hz
r = 0.2;        % ear distance / m
c = 343;        % speed of sound / m/s

t = -r/c * sind(alpha);
tsamples = round(t*fs);

if tsamples >= 0 % compare Fig. 1; signal to the right von rechts => delay left
    out_l = [zeros(tsamples,1); insig];
    out_r = [insig; zeros(tsamples,1)];
else  % compare Fig. 1; signal to the left => right delay
    out_r = [zeros(-tsamples,1); insig];
    out_l = [insig; zeros(-tsamples,1)];
end

outsig = 0.5 .* [out_l out_r];
