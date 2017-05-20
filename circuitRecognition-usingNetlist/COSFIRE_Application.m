function output = COSFIRE_Application(trainingImage,testingImage)
% Keypoint detection by a COSFIRE filter
%
% VERSION 01/07/2012
% CREATED BY: George Azzopardi and Nicolai Petkov, University of Groningen,
%             Johann Bernoulli Institute for Mathematics and Computer Science, Intelligent Systems
%
% If you use this script please cite the following paper:
%   George Azzopardi and Nicolai Petkov, "Trainable COSFIRE filters for
%   keypoint detection and pattern recognition", IEEE Transactions on Pattern 
%   Analysis and Machine Intelligence, 2012, DOI: 10.1109/TPAMI.2012.106
% 
% A COSFIRE filter is automatically configured by a prototype pattern and
% can then be used to detect the same and similar patterns. The configuration 
% comprises selecting given channels of a bank of orientation-selective filters 
% and determining certain blur and shift parameters. Here we use Gabor
% filters, however Gabor filters are not intrinsic to the method and any
% other orientation-selective filters can be used. The area of support of the resulting 
% COSFIRE filter is adaptive as it is composed of the support of a number of 
% orientation-selective filters whose geometrical arrangement around a point of 
% interest is learned from a single prototype pattern. A COSFIRE filter response 
% is computed as the weighted geometric mean of the blurred and shifted responses 
% of the selected Gabor filters. 
%
% COSFIRE_Application takes as input:
%    trainingImage -> intensity image that is used to configure a COSFIRE
%                     filter for a specified pattern
%    testingImage  -> intensity image to which the configured COSFIRE
%                     filter is applied
%
% COSFIRE_Application returns:
%    output        -> the response (every pixel varies between 0 and 1) of 
%                     the COSFIRE filter to the testingImage.
% 
% Example: output = COSFIRE_Application(imread('pattern.bmp'),imread('pattern.bmp'));

% Update the Matlab path with the following
path('../COSFIRE/',path);
path('../Gabor/',path);

% Specify the location of the a point of itnerestin in the given
% trainingImage. This can be done either interactively by enabling the
% following command or by specifying directly the (x,y) coordinates 
% figure;imshow(trainingImage);axis off; [x y] = ginput(1);

x = 132; y = 116;

% Configure a COSFIRE operator
operator = configureCOSFIRE(trainingImage,round([y,x]));    

% Show the structure of the COSFIRE operator
viewCOSFIREstructure(operator);       

% Apply the COSFIRE to the input image
output = applyCOSFIRE(testingImage,operator);

% Show the detected points based on the maxima responses of output.
maximaPoints(testingImage,{output},8,1);