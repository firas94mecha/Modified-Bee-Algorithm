function z = Rastrigin(x)

z = 10*numel(x)+sum(x.^2-10*cos(2*pi*x));
end
% -5.12<= xi <=5.12
% global minimum z=0 when xi = 0
% https://www.sfu.ca/~ssurjano/rastr.html