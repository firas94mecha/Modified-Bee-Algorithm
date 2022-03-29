function z = Martin_Gaddy(x)
x1=x(1);
x2=x(2);
z = (x1-x2)^2+((x1+x2-10)/3)^2;
end
% -20<= xi <=20
% global minimum z=0 when xi = 0