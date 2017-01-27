function outsig = intensity_stereo(insig,alpha)
%INTENSITY_STEREO pans a signal based on interaural level differences
%
%   Usage: outsig = intensity_stereo(insig,alpha)
%
%   Input parameters:
%       insig - monoral signal
%       alpha - desired panning direction / deg
%
%   Output parameters:
%       outsig - two-channel stereo signal

x = -sind(alpha);

y_r = (x+1) * 0.5;
y_l = (1-x) * 0.5;

out_r = y_r * insig;
out_l = y_l * insig;

outsig = [out_l out_r];
