function z = Griewangk(x)
y=1;
for i=1:numel(x)
    y=y*cos(x(i)/sqrt(i));
end
z = 1/4000*sum(x.^2)-y+1;
end
% -600<= xi <=600
% global minimum z=0 when xi = 0
% https://www.sfu.ca/~ssurjano/griewank.html