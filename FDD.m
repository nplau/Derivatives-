% Forward Divided Difference
function derivative = FDD(data, x, h)
  % Calculate F(x) and F(x-h) by looking up the y value in the table
  fx = data(x+1, 2);
  fxh = data(x+1+h, 2);
  
  % Calculate the derivative
  derivative = (fxh - fx)/h;
end
