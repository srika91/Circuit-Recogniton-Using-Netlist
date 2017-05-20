%%%%  This function can be used for corner and edge detection
%%%% for any RGB or grayscale image. It is based upon the famous
%%%% paper on the topic titled "A Combined Corner and Edge Detector"
%%%% by Harris and stephens.


%%%%%%%%%%%%% input arguments
%%%%% input = The input image whose corners and edges are to be detected. 
%%%%% sigma(optional) =  Standard deviation of gaussian filter . Default is
%%%%% 1.
%%%%% kernelsize(optional) = The size of gaussian kernel. Default is 8.
%%%%% thresh(optional) = threshhlod value to be used as described in the
%%%%% algorithm. Default is 0.002.
%%%%% ratio(optional) = The algorithm requires that gradients be convolved
%%%%% with a larger gaussian the second time around. This is the ratio of the
%%%%% of sigma to be used second time to that used first time. Default is
%%%%% 1.5.


%%%%%%%%%%%%  output arguments
%%%%%% O= output binary image containing detected corners and regions.

%%%%%%% Example:-
%%%%%%%%%%%% O = feature_detection('bus10.jpg',1(sigma),8 (kernelsize),
%%%%%%%%%%%% 0.002 (thresh),1.5(ratio));



function O=feature_detection(input,varargin)
%%%% validate the arguments
error(nargchk(1,5,nargin));
%%% assign values to the input paraameters as per number of arguments
%%% specified by the user.
sigma=1;
kernelsize=8;
thresh=0.002;
ratio=1.5;
if(nargin>1)
    sigma=varargin{1}(:);
end
if(nargin>2)
    kernelsize=varargin{2}(:);
end
if(nargin>3)
    thresh=varargin{3}(:);
end
if(nargin>4)
    ratio=varargin{4}(:);
end
%%%% Read the image.
I=imread(input);
%%% if the image is RGB, convert it into grayscale. 
if(size(I,3)==3)
    I=rgb2gray(I);
end
%%% convert the image to double and display it.
I=im2double(I);
imtool(I);
%%% smoothen the image using gaussian filter.
h=fspecial('gaussian',kernelsize,sigma);
I=imfilter(I,h,'conv');
O=zeros(size(I,1),size(I,2));
% Calculate the gradient using the 7-tap Coefficients given by Farid and
% Simoncelli given in their paper "Differentiation of Discrete
% Multi-Dimensional Signals".
p = [ 0.004711  0.069321  0.245410  0.361117  0.245410  0.069321  0.004711];
  d1 = [ 0.018708  0.125376  0.193091  0.000000 -0.193091 -0.125376 -0.018708];
  FX=conv2(p,d1,I,'same');
  FY=conv2(d1,p,I,'same');
  FX=FX.^2;
  FY=FY.^2;
  FXY=conv2(d1,p,I,'same');
  %%%% convolve the gradients with a larger gaussian.
  gauss=fspecial('gaussian',ceil(ratio*kernelsize),sigma);
  FX=imfilter(FX,gauss,'conv');
  FY=imfilter(FY,gauss,'conv');
  FXY=imfilter(FXY,gauss,'conv');
  %%% each point in the image compute the scalar interest measure and
  %%% compare it with specified thresh. If greater then set the
  %%% corresponding pixel in output to be 1.
  for y=1:1:size(I,1)
      for x=1:1:size(I,2)
          mat=[FX(y,x),FXY(y,x);FXY(y,x),FY(y,x)];
          V=eigs(mat);
          lambda1=abs(V(1));
          lambda2=abs(V(2));
   calc=(lambda1*lambda2)-0.06*(lambda1+lambda2).^2;
   if(calc>abs(thresh))
       O(y,x)=1;
   end
      end
  end
  imshow(O);