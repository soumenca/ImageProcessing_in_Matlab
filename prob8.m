clear;

imgRGB = imread('image1.jpg');
img = imgRGB(:,:,1);
imgArr = reshape(img, [], 1);
ResultRLE = RLE(imgArr);

%arr = [15 15 15 7 2 2 100 100 117 117 12];
%ResultRLE = RLE(arr);

ResultRLE( ~any(ResultRLE, 2), : ) = [];  
disp(ResultRLE);


function Output2D = RLE(InputArr)
Output2D = zeros(length(InputArr), 2);
L = length(InputArr);
j = 1;
k = 1;
while j <= L
    occurrence = 1;
    for j = j:L
        if j == L 
            break
        end  
        if InputArr(j) == InputArr(j+1)
            occurrence = occurrence + 1;
        else
            break
        end
    end   
    Output2D(k, 2) = occurrence;
    Output2D(k, 1) = InputArr(j);
    if j == L && InputArr(j-1) == InputArr(j) 
        break
    end 
    k = k+1;
    j = j+1;
    if j == L      
        Output2D(k, 2) = 1;
        Output2D(k, 1) = InputArr(j);
        break
    end
end
end