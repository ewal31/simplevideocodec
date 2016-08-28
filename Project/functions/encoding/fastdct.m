%Implemented is a version of a fast DCT (runs approximately 30% faster)
function y = fastdct(x, C, s, a)

    x1 = [x(:, 1:4)+x(:, 8:-1:5), x(:, 4:-1:1)-x(:, 5:8)];
    x2 = [x1(:, 1:2)+x1(:, 4:-1:3), x1(:, 2:-1:1)-x1(:, 3:4), -1*x1(:, 5)-x1(:, 6), ...
                                            x1(:, 6:7)+x1(:, 7:8), x1(:, 8)];
    x3 = [x2(:, 1)+x2(:, 2), x2(:, 1)-x2(:, 2), x2(:, 3)+x2(:, 4), x2(:, 4:8)];

    temp = (x3(:, 5)+x3(:, 7))*a(5);
    x4 = [x3(:, 1:2), x3(:, 3)*a(1), x3(:, 4), -1*x3(:, 5)*a(2)-temp, ...
                                x3(:, 6)*a(3), x3(:, 7)*a(4)-temp, x3(:, 8)];

    x5 = [x4(:, 1:2), x4(:, 3)+x4(:, 4), x4(:, 4)-x4(:, 3), x4(:, 5), ...
                                    x4(:, 6)+x4(:, 8), x4(:, 7), x4(:, 8)-x4(:, 6)];

    x6 = [x5(:, 1:4), x5(:, 5:6)+x5(:, 8:-1:7), x5(:, 6)-x5(:, 7), x5(:, 8)-x5(:, 5)];

    y = [s(1)*x6(:, 1), s(2)*x6(:, 6), s(3)*x6(:, 3), s(4)*x6(:, 8), s(5)*x6(:, 2), s(6)*x6(:, 5), s(7)*x6(:, 4), s(8)*x6(:, 7)];

end