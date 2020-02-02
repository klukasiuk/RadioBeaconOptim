function [x_hat,DOP] = calc_dop(lanterns, distances)
    
%% Params

n = size(lanterns,1);
A = zeros(n,3);
B = zeros(n,1);

%% A matrix

for i = 1:n
	A(i,1) = 1;
	A(i,2) = -2*lanterns(i,1);
	A(i,3) = -2*lanterns(i,2);
end

if rcond(A' * A) < 1e-15 || isnan(rcond(A' * A))
    x = [0,0];
	DOP = 500;
	return
end
    
%% B matrix
    
for i = 1:n
	B(i,1) = distances(i)^2 - lanterns(i,1)^2 - lanterns(i,2)^2;
end
    
%% Calc x_hat

x_hat = inv(A' * A) * A' * B;
    
%% Calc DOP
    
C = zeros(n,2);
    
for i = 1:n
	C(i,1) = (x_hat(2) - lanterns(i,1))/distances(i);
	C(i,2) = (x_hat(3) - lanterns(i,2))/distances(i);
end
    
if rcond(C' * C) < 1e-12 || isnan(rcond(C' * C))
	x = [0,0];
	DOP = 500;
	return
end

Q = inv(C'*C);
    
DOP = sqrt(Q(1,1) + Q(2,2));
    
end

