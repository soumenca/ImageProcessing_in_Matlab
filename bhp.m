function res = bhp(F, d0, order)

[m, n] = size(F);

d = zeros(m, n);
H = zeros(m, n);

for i = 1:m
    for j = 1:n
    	d(i,j) = sqrt( (i-(m/2))^2 + (j-(n/2))^2);
    end
end

for i = 1:m
    for j = 1:n
	    H(i,j) = 1 / (1+ (d0/d(i,j))^(2*order) ) ;
    end
end


for i = 1:m
    for j = 1:n
	    res(i,j) = (H(i,j)) * F(i,j);
    end
end


