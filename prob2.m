clear;

%Importing image
img = imread('2.JPG');
[m, n, k] = size(img);

%Computing gamma transformation for three different gamma.
gamma = 5;
gamma1 = 2;
gamma2 = .5;
fimg = img;
fimg1 = img;
img2 = double(img);
fimg2 = img;
for i = 1:3
    fimg(:,:,i) = img(:,:,i) .^ gamma;
	fimg1(:,:,i) = img(:,:,i) .^ gamma1;
	fimg2(:,:,i) = img2(:,:,i) .^ gamma2;
end


%Displaying the result
figure,
subplot(2,2,1),
imshow(img);
title('Original Image');

subplot(2,2,2),
imshow(fimg);
title('Transform Image(Gamma=5)');

subplot(2,2,3),
imshow(fimg1);
title('Transform Image(Gamma=2)');

subplot(2,2,4),
imshow(fimg2);
title('Transform Image(Gamma=.5)');

