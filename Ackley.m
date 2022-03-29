function z = Ackley(x)

z = -20*exp(-0.2*sqrt(1/numel(x)*sum(x.^2)))-exp(1/numel(x)*sum(cos(2*pi*x)))+20+exp(1);
end
% -32,768<= xi <=32,768
% global minimum z=0 when xi = 0
% https://www.sfu.ca/~ssurjano/ackley.html