function params = Parameters
% VERSION 28/05/2012
% CREATED BY: George Azzopardi and Nicolai Petkov, University of Groningen,
%             Johann Bernoulli Institute for Mathematics and Computer Science, Intelligent Systems
%
% SystemConfig returns a structure of the parameters required by the
% COSFIRE operator

% The radii list of concentric circles
params.COSFIRE.rholist                = [0 4 9 15 22];

% Minimum distance between dominant contours lying on the same concentric circle
params.COSFIRE.eta                    = pi/8;

% Threshold parameter used to suppress the input filters responses that are less than a
% fraction t1 of the maximum
params.COSFIRE.t1                     = 0.2;

% Threshold parameter used to select the channels of input filters that
% produce a response larger than a fraction t2 of the maximum
params.COSFIRE.t2                     = 0.5;

% Parameters of the Gaussian function used to blur the input filter
% responses. sigma = sigma0 + alpha*rho_i
params.COSFIRE.sigma0                 = 0.67;
params.COSFIRE.alpha                  = 0.1;

% mintupleweight is the weight assigned to the peripherial contour parts
params.COSFIRE.mintupleweight         = 0.5;
params.COSFIRE.outputfunction         = 'weightedgeometricmean';
params.COSFIRE.blurringfunction       = 'sum'; %max or sum

% Weights are computed from a 1D Gaussian function. weightingsigma is the
% standard deviation of this Guassian function
params.COSFIRE.weightingsigma         = sqrt(-max(params.COSFIRE.rholist)^2/(2*log(params.COSFIRE.mintupleweight)));

% Threshold parameter used to suppress the responses of the COSFIRE filters
% that are less than a fraction t3 of the maximum response.
params.COSFIRE.t3                     = 0.25;

% Parameters of some geometric invariances
params.invariance.rotation.psilist    = (0:22.5:359)*pi/180;
params.invariance.scale.upsilonlist   = 2.^(-0.5:0.5:0.5);
params.invariance.reflection          = 1; % Reflection invariance about the y-axis. 0 = do not use, 1 = use.

% Minimum distance allowed between detected keypoints. If the distance
% between any two pairs of detected keypoints is less than
% params.distance.mindistance then we keep only the stronger one.
params.detection.mindistance          = 8;

% Parameters of the input filter. Here we use symmetric Gabor filters.
% Gabor filters are, however, not intrinsic to the method and any other
% filters can be used.
params.inputfilter.name                    = 'Gabor';
params.inputfilter.Gabor.thetalist          = 0:pi/8:(2*pi)-pi/8;
params.inputfilter.Gabor.lambdalist         = [4,4*sqrt(2)];
params.inputfilter.Gabor.phaseoffset        = pi;
params.inputfilter.Gabor.halfwaverect       = 0;
params.inputfilter.Gabor.bandwidth          = 2;
params.inputfilter.Gabor.aspectratio        = 0.5;
params.inputfilter.Gabor.inhibition.method  = 1;
params.inputfilter.Gabor.inhibition.alpha   = 0;
params.inputfilter.Gabor.thinning           = 0;

if strcmp(params.inputfilter.name,'Gabor')
    params.inputfilter.symmetric = ismember(params.inputfilter.Gabor.phaseoffset,[0 pi]);
else 
    % Other input filter type
    params.inputfilter.symmetric = 1;
end