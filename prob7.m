clear;

imgRGB = imread('image.jpg');
imgRGBnormalized = imgRGB/255;

R = imgRGBnormalized(:,:,1);
G = imgRGBnormalized(:,:,2);
B = imgRGBnormalized(:,:,3);

eps = 0.0000001;
I = (R + G + B) ./ 3;
S = 1 - (3 ./ max((R + G + B), eps)) .* min(imgRGBnormalized, [], 3);

theta1 = double(((R - G) + (R - B)) ./ 2);
theta2 = double((R - G) .^ 2 + (R - B) .* (G - B)) ;
theta = double(theta1 ./ sqrt(max(theta2, eps)));

H = acosd(theta);
H(B > G) = 360 - H(B > G);
H = H ./ 360;



%Displying the result
figure,
subplot(2,3,1),
histogram(R);
title('Red Image');

subplot(2,3,2),
histogram(G);
title('Green Image');

subplot(2,3,3),
histogram(B);
title('Blue Image');

subplot(2,3,4),
histogram(H);
title('Hu Image');

subplot(2,3,5),
histogram(S);
title('S Image');

subplot(2,3,6),
histogram(I);
title('I Image');