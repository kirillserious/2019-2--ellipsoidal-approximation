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
%%
q1Vec = [1; 2];
q2Vec = [2; 1];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];
figure, hold on, grid on;
[xs, ys] = ellipse_coords(q1Vec, q1Mat);
plot(xs, ys, 'r');
[xs, ys] = ellipse_coords(q2Vec, q2Mat);
plot(xs, ys, 'r');
[xs, ys] = outer_ellipse_coords([1;2], q1Vec, q1Mat, q2Vec, q2Mat);
plot(xs, ys, 'b');
%%
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];
figure, hold on, grid on;
[xs, ys] = ellipse_coords(q1Vec, q1Mat);
plot(xs, ys, 'r');
[xs, ys] = ellipse_coords(q2Vec, q2Mat);
plot(xs, ys, 'r');
phiVec = linspace(1, 2*pi, 100);
for phi = phiVec
    lVec = [cos(phi); sin(phi)];
    [xs, ys] = outer_ellipse_coords(lVec, q1Vec, q1Mat, q2Vec, q2Mat);
    plot(xs, ys, 'b');
end

%%
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];
figure, hold on, grid on;
[xs, ys] = ellipse_coords(q1Vec, q1Mat);
plot(xs, ys, 'r');
[xs, ys] = ellipse_coords(q2Vec, q2Mat);
plot(xs, ys, 'r');
[xs, ys] = inner_ellipse_coords([sin(1); cos(1)], q1Vec, q1Mat, q2Vec, q2Mat);
plot(xs, ys);
[xs, ys] = sum_ellipse_coords(q1Vec, q1Mat, q2Vec, q2Mat);
plot(xs, ys);
%%
q1Vec = [0; 0];
q2Vec = [0; 0];
q1Mat = [1, 0; 0, 2];
q2Mat = [5, 3; 3, 2];
figure, hold on, grid on;
[xs, ys] = ellipse_coords(q1Vec, q1Mat);
plot(xs, ys, 'r');
[xs, ys] = ellipse_coords(q2Vec, q2Mat);
plot(xs, ys, 'r');

phiVec = linspace(0, 2*pi, 100);
for phi = phiVec
    l = [sin(phi); cos(phi)];
    [xs, ys] = inner_ellipse_coords(l, q1Vec, q1Mat, q2Vec, q2Mat);
    plot(xs, ys, 'b');
end
[xs, ys] = sum_ellipse_coords(q1Vec, q1Mat, q2Vec, q2Mat);
plot(xs, ys);

