function res = ihp(F, d0)

[m, n] = size(F);

d = zeros(m,n);
H = zeros(m,n);

for i = 1:m
    for j = 1:n
    	d(i,j) = sqrt( (i-(m/2))^2 + (j-(n/2))^2);
    end
end

for i = 1:m
    for j = 1:n
		if d(i,j) <= d0
			H(i,j) = 0;
	    else
			H(i,j) = 1;
		end
    end
end


for i = 1:m
    for j = 1:n
	    res(i,j) = (H(i,j)) * F(i,j);
    end
end


