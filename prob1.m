clear;

%Importing image
img = imread('2.JPG');
[m, n, k] = size(img);
MN = m*n;

%Computing Histogram Equalization for three channels
hImg = histEqu(img(:,:,1), m, n, MN);
hImg(:,:,2) = histEqu(img(:,:,2), m, n, MN);
hImg(:,:,3) = histEqu(img(:,:,3), m, n, MN);


%Displaying the result for three channel
figure,
subplot(2,3,1),
imshow(hImg(:,:,1));
title('Red Image');

subplot(2,3,2),
imshow(hImg(:,:,2));
title('Green Image');

subplot(2,3,3),
imshow(hImg(:,:,3));
title('Blue Image');

subplot(2,3,4),
histogram(hImg(:,:,1));
title('Red Image');

subplot(2,3,5),
histogram(hImg(:,:,2));
title('Green Image');

subplot(2,3,6),
histogram(hImg(:,:,3));
title('Blue Image');


%Displaying the Histogram Equalized image
figure,
subplot(2,2,1),
imshow(img);
title('Original Image');

subplot(2,2,2),
histogram(img);
title('Original Image');

subplot(2,2,3),
imshow(hImg);
title('Equalized Image');

subplot(2,2,4),
histogram(hImg);
title('Equalized Image');


function hImg = histEqu(Img, m, n, MN)
	hImg=uint8(zeros(m, n));
	freq=zeros(256,1);
	probf=zeros(256,1);
	probc=zeros(256,1);
	cum=zeros(256,1);
	output=zeros(256,1);

	for i=1:m
	    for j=1:n
	        value=Img(i,j);
	        freq(value+1)=freq(value+1)+1;
	    end
	end
	probf=freq/MN;

	sum=0;
	no_bins=255;
	
	for i=1:size(probf)
		sum=sum+freq(i);
		cum(i)=sum;
	   	probc(i)=cum(i)/MN;
	   	output(i)=round(probc(i)*no_bins);
	end

	for i=1:m
	    for j=1:n
			hImg(i,j)=output(Img(i,j)+1);
	    end
	end

end
