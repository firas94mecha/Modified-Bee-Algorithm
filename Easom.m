function z = Easom(x)
x1=x(1);
x2=x(2);
z = -cos(x1)*cos(x2)*exp(-(x1-pi)^2-(x2-pi)^2);
end
% -100<= xi <=100
% global minimum z=-1 when (x1,x2) = (pi, pi)
% https://www.sfu.ca/~ssurjano/easom.html