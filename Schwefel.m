function z = Schwefel(x)

z = 418.9829*numel(x)-sum(-x.*sin(sqrt(abs(x))));
end
% -500<= xi <=500
% global minimum z=0 when xi = 420.9687
% https://www.sfu.ca/~ssurjano/schwef.html
%r=5