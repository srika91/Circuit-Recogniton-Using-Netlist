
% Function to find the Zernike moments for an N x N binary ROI
%
% [Z A Phi] = Zernikmoment(p,n,m)
% where
%   p = input image N x N (N should be an even number)
%   n = The order of Zernike moment
%   m = The iterration number of Zernike moment
% and
%   Z = Complex Zernike moment 
%   A = Amplitude of the moment
%   Phi = phase (angle) of the mement (in degrees)
%
% Example: 
%   1- calculate the Zernike moment (n,m) for an oval shape,
%   2- rotate the oval shape around its centeroid,
%   3- calculate the Zernike moment (n,m) again,
%   4- the amplitude of the moment (A) should be the same for both images
%   5- the phase (Phi) should be equal to the angle of rotation
% -------------------------------------------------------------------------

function [Z A Phi] = Zernikmoment(p,n,m)
N = size(p,1);
x = 1:N; y = x;
[X,Y] = meshgrid(x,y);
R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
R = (R<=1).*R;
Rad = radialpoly(R,n,m);    % get the radial polynomial

Product = p(x,y).*Rad.*exp(-1i*m*Theta);
Z = sum(Product(:));        % calculate the moments

cnt = nnz(R)+1;             % count the number of pixels inside the unit circle
Z = (n+1)*Z/cnt;            % normalize the amplitude of moments
A = abs(Z);                 % calculate the amplitude of the moment
Phi = angle(Z)*180/pi;      % calculate the phase of the mement (in degr