function res = ghp(F, d0)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius

%outputs
% res is the filtered image

[m,n] = size(F);

d = zeros(m,n);
H = zeros(m,n);

for i = 1:m
    for j = 1:n
    	d(i,j) = sqrt( (i-(m/2))^2 + (j-(n/2))^2);
    end
end

for i = 1:m
    for j = 1:n
    	H(i,j) = 1- exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
    end
end


for i = 1:m
    for j = 1:n
    	res(i,j) = (H(i,j)) * F(i,j);
    end
end
