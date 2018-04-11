clear;

imgRGB = imread('image1.jpg');
img = imgRGB(:,:,1);
[m, n] = size(img);
np = ceil((log(max(m, n)) / log(2)));
N = 2^np;
K = N - 1;
H = double(haarMtxFun(N));
TH = transpose(H);
imgResize = double(imresize(img, [N, N]));
T = H * imgResize * TH;
imshow(T);


function H = haarMtxFun(N)
    a = 1 / sqrt(N);
    for i = 1:N
        H(1,i) = a;
    end
    for k = 1:N-1
        p = fix(log(k) / log(2));
        q = k-2^p+1;
        t1 = N / 2^p;
        sup = fix(q*t1);
        mid = fix(sup-t1/2);
        inf = fix(sup-t1);
        t2 = 2^(p/2)*a;
        for j = 1:inf
            H(k+1, j) = 0;
        end
        for j = (inf + 1):mid
            H(k+1, j) = t2;
        end
        for j = (mid + 1):sup
            H(k+1, j) = -t2;
        end
        for j = (sup + 1):N
            H(k+1, j) = 0;
        end
    end
end