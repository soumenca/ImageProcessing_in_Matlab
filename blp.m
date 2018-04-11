function res = blp(F, d0, order)

[m, n] = size(F);

d = zeros(m, n);
h = zeros(m, n);

for i = 1:m
    for j = 1:n
    	d(i,j) = sqrt( (i-(m/2))^2 + (j-(n/2))^2);
    end
end

for i = 1:m
    for j = 1:n
     	h(i,j) = 1 / (1 + (d(i,j)/d0)^(2*order) ) ;
    end
end


for i = 1:m
    for j = 1:n
    	res(i,j) = (h(i,j)) * F(i,j);
    end
end

