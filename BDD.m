% Backward Divided Difference
function derivative = BDD(data, x, h)
  x = x + 1; % Because the table is 0 indexed
  
  % Calculate F(x) and F(x-h) by looking up the y value in the table
  fx = data(x, 2);
  fxh = data(x-h, 2);

  % Calculate the derivative
  derivative = (fx - fxh) / h;
end
