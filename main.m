load test_1.txt

fprintf("1. Forward Divided Difference (FDD) \n2. Backward Divided Difference (BDD) \n3. Central Divided Difference (CDD) \n");
choice = input("Choose your derivative method (pick a number): ");
point = input("Choose your x: ");
y = 0;

% Check if the point is in bounds
if point < min(test_1(:,1)) || point > max(test_1(:,1))
    fprintf("Point is outside the data limits.\n");
    return;
end

% Check if the point is in the data set
if ~ismember(point, test_1(:,1))
    choice = 4;
end

% Find the minimum delta x
h = 0;
for i = 1:length(test_1)-1
    if h == 0
        h = test_1(i+1,1) - test_1(i,1);
    else
        if h > test_1(i+1,1) - test_1(i,1)
            h = test_1(i+1,1) - test_1(i,1);
        end
    end
end

str = sprintf("delta x = %g\n", h);
fprintf(str);

% FDD
if choice == 1 
    derivative = FDD(test_1, point, h);
    fprintf('f''(%d) = %f\n', point, derivative);
end

% BDD
if choice == 2
    derivative = BDD(test_1, point, h);
    fprintf('f''(%d) = %f\n', point, derivative);
end

% CDD
if choice == 3 
    forward = FDD(test_1, point, h);
    backward = BDD(test_1, point, h);
    derivative = (forward + backward)/(2 * h);
    fprintf('f''(%d) = %f\n', point, derivative);
end

% CDD but with polynomial
if choice == 4
    forward = polynomial(test_1, 3, point + h);
    backward = polynomial(test_1, 3, point - h);
    derivative = (forward - backward)/(2*h);
    fprintf('f''(%f) = %f\n', point, derivative);

    % Show the graph of the polynomial by callling polynomial_w_plot
    polynomial_w_plot(test_1, 3, point, derivative);
end