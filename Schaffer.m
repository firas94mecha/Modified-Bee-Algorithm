function z = Schaffer(x)
x1=x(1);
x2=x(2);
z = 0.5+(sin(x1^2-x2^2)^2-0.5)/(1+0.001*(x1^2+x2^2))^2;

end
% -100<= xi <= 100
%global minimum z=0 when xi=0
% https://www.sfu.ca/~ssurjano/schaffer2.html
%r=2