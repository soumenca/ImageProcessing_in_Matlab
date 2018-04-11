function res = glp(F, d0)

[m, n] = size(F);

d = double(zeros(m,n));
h = double(zeros(m,n));

for i = 1:m
    for j = 1:n
    	d(i,j) = sqrt( (i-(m/2))^2 + (j-(n/2))^2);
    end
end

for i = 1:m
    for j = 1:n
    	h(i,j) = exp( -( (d(i,j)^2)/(2*((d0)^2)) ) );
    end
end

for i = 1:m
    for j = 1:n
    	res(i,j) = h(i,j) * F(i,j);
    end
end
