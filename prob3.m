clear;

% Importing gray scale image
imgg = imread('3.JPG');
img = imgg(:,:,1);
[m, n] = size(img);
sImg = img;
%sImg1 = img;

% Filter definitation
w = [1 2 1 2 4 2 1 2 1];
%w = [1 1 1 1 1 1 1 1 1];
weight = sum(w);

%Filtering the original Image
for i = 1:m
	for j = 1:n
		z = [getPixel(img, i-1, j-1, m,n), getPixel(img, i-1, j, m,n), getPixel(img, i-1, j+1, m,n), getPixel(img, i, j-1, m,n), getPixel(img, i, j, m,n), getPixel(img, i, j+1, m,n), getPixel(img, i+1, j-1, m,n), getPixel(img, i+1, j, m,n), getPixel(img, i+1, j+1, m,n)];
		sImg(i, j) = round(sum(int8(w) .* int8(z)) / weight);
	end
end






%Filtering the original Image
for i = 1:m
	for j = 1:n
		z = [getPixel(img, i-1, j-1, m,n), getPixel(img, i-1, j, m,n), getPixel(img, i-1, j+1, m,n), getPixel(img, i, j-1, m,n), getPixel(img, i, j, m,n), getPixel(img, i, j+1, m,n), getPixel(img, i+1, j-1, m,n), getPixel(img, i+1, j, m,n), getPixel(img, i+1, j+1, m,n)];
		sImg1(i, j) = median(uint8(z));
	end
end


%Printing the Image and the histogram
figure,
subplot(2,2,1),
imshow(img);
title('Original Image');

subplot(2,2,2),
histogram(img);
title('Original Image');

subplot(2,2,3),
imshow(sImg);
title('Smoothen Image');

subplot(2,2,4),
imshow(sImg1);
title('Smoothen Image using Median filter');


function pixl = getPixel(img, x, y, m, n)
    if x < 1 || y < 1 || x >= m || y >= n
        pixl = 0;
    else
        pixl = img(x, y);
	end

