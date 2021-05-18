%% Рисуем эллипс
qVec = [1; 2];
qMat = [5, 3; 3, 2];

[xs, ys] = ellipse_coords(qVec, qMat);

figure, hold on, grid on;
plot(xs, ys);
xlabel('$$x_1$$', 'interpreter', 'latex');
ylabel('$$x_2$$', 'interpreter', 'latex');
legend off;

%% Рисуем сумму двух эллипсов
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];

figure, hold on, grid on;
color1 = [0, 0.4470, 0.7410];
color2 = [0.8500, 0.3250, 0.0980];

[xs, ys] = ellipse_coords(q1Vec, q1Mat);
p1 = plot(xs, ys, 'Color', color1);
[xs, ys] = ellipse_coords(q2Vec, q2Mat);
plot(xs, ys, 'Color', color1);
[xs, ys] = sum_ellipse_coords(q1Vec, q1Mat, q2Vec, q2Mat);
p2 = plot(xs, ys, 'Color', color2);

xlabel('$$x_1$$', 'interpreter', 'latex');
ylabel('$$x_2$$', 'interpreter', 'latex');
legend([p1, p2], 'Эллипсоиды', 'Сумма Минковского', 'Location', 'northwest');

%% Рисуем внешнюю аппроксимацию суммы эллипсоидов
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];

figure, hold on, grid on;
color1 = [0, 0.4470, 0.7410];
color2 = [0.8500, 0.3250, 0.0980];

phiVec = linspace(1, 2*pi, 100);
for phi = phiVec
    lVec = [cos(phi); sin(phi)];
    [xs, ys] = outer_ellipse_sum_coords(lVec, q1Vec, q1Mat, q2Vec, q2Mat);
    p1 = plot(xs, ys, 'Color', color1);
end

[xs, ys] = sum_ellipse_coords(q1Vec, q1Mat, q2Vec, q2Mat);
p2 = plot(xs, ys, 'Color', color2);

xlabel('$$x_1$$', 'interpreter', 'latex');
ylabel('$$x_2$$', 'interpreter', 'latex');
legend([p2, p1], 'Сумма Минковского', 'Аппроксимации', 'Location', 'northwest');

%% Рисуем внутреннюю аппроксимацию суммы эллипсоидов
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];

figure, hold on, grid on;
color1 = [0, 0.4470, 0.7410];
color2 = [0.8500, 0.3250, 0.0980];

phiVec = linspace(1, 2*pi, 100);
for phi = phiVec
    lVec = [cos(phi); sin(phi)];
    [xs, ys] = inner_ellipse_sum_coords(lVec, q1Vec, q1Mat, q2Vec, q2Mat);
    p1 = plot(xs, ys, 'Color', color1);
end

[xs, ys] = sum_ellipse_coords(q1Vec, q1Mat, q2Vec, q2Mat);
p2 = plot(xs, ys, 'Color', color2);

xlabel('$$x_1$$', 'interpreter', 'latex');
ylabel('$$x_2$$', 'interpreter', 'latex');
legend([p2, p1], 'Сумма Минковского', 'Аппроксимации', 'Location', 'northwest');

%% Рисуем обе аппроксимацию суммы эллипсоидов
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];

figure, hold on, grid on;
color1 = [0, 0.4470, 0.7410];
color2 = [0.8500, 0.3250, 0.0980];

phiVec = linspace(1, 2*pi, 50);
for phi = phiVec
    lVec = [cos(phi); sin(phi)];
    [xs, ys] = outer_ellipse_sum_coords(lVec, q1Vec, q1Mat, q2Vec, q2Mat);
    p1 = plot(xs, ys, 'Color', color1);
    [xs, ys] = inner_ellipse_sum_coords(lVec, q1Vec, q1Mat, q2Vec, q2Mat);
    p2 = plot(xs, ys, 'Color', color2);
end

xlabel('$$x_1$$', 'interpreter', 'latex');
ylabel('$$x_2$$', 'interpreter', 'latex');
legend([p1, p2], 'Внешние аппроксимации', 'Внутренние аппроксимации', 'Location', 'northwest');

