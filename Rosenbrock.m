function z = Rosenbrock(x)
z=0;
for i=1:numel(x)-1
    z = z+(100*(x(i+1)-x(i)^2)^2+(1-x(i))^2);
end
end
% -2.048<= xi <= 2.048
% global minimum z=0 when x=(1, ... , 1)
% https://www.sfu.ca/~ssurjano/rosen.html