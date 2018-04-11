% Frequency Domain Filters............
clear;
%Importing image
imgg = imread('3.JPG');
img = imgg(:,:,1);
cimg = double(img);
[m,n] = size(img);

M = 2 * m;
C = 2 * n;

pimg = zeros(M, C);
ctimg = zeros(M, C);

%padding zeros
for i = 1:m
    for j = 1:n
		pimg(i,j) = cimg(i,j);
    end
end

%center the transform
for i = 1:m
    for j = 1:n
		ctimg(i,j) = pimg(i,j) * ((-1)^(i+j));
    end
end


%2D fast fourier transform
fimg = fft2(ctimg);

order = 1; %order for butterworth filter
d0 = 10; % cutoff radius

% % function call for low pass filters.......................
 himg = glp(fimg, d0); % gaussian low pass filter
% himg = blp(fimg, d0, order); % butterworth low pass filter
%himg = ilp(fimg, d0);	%ideal low pass filter

%inverse 2D fast fourier transform
ifimg = ifft2(himg);
 
for i = 1:M
    for j = 1:C
    	ifimg(i,j) = ifimg(i,j) * ((-1)^(i+j));
    end
end


% removing the padding
for i = 1:m
    for j = 1:n
		rimg(i,j) = ifimg(i,j);
    end
end

% retaining the real parts of the matrix
rimg = real(rimg);
rimg = uint8(rimg);


figure;
subplot(2,3,1);imshow(img);title('Original Image');
subplot(2,3,2);imshow(uint8(ctimg));title('Padding');
subplot(2,3,3);imshow(uint8(fimg));title('Transform Centering');
subplot(2,3,4);imshow(uint8(himg));title('Fourier Transform');
subplot(2,3,5);imshow(uint8(ifimg));title('Inverse Fourier Transform');
subplot(2,3,6);imshow(rimg);title('Smooth Image');


