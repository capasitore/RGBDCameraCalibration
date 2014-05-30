%   Tao Du
%   taodu@stanford.edu
%   May 29, 2014

%   this function optimize the primesense's focal length
function [ fc ] = opt_primesense()
    %   load the calib results
    %   by default its name is Calib_Results_Left.mat
    load('Calib_Results_Left.mat');
    %   load the depth image D_1, D_2, ...
    for i = 1 : n_ima
        D = double(imread(['depth_',...
                num2str(i, '%.4d'), '.png']));
        D(D == Inf | isnan(D)) = 0;
        eval(['D_', num2str(i), ' = D;']);
    end

    %   compute Z_d1, Z_d2, ...
    %   they store the depth image information for x_1, x_2, ...
    is_active = zeros(1, n_ima);
    for i = 1 : n_ima
        eval(['x_cur = x_', num2str(i), ';']);
        [~, n_corners] = size(x_cur);
        Z_d = zeros(1, n_corners);
        eval(['D_cur = D_', num2str(i), ';']);
        for j = 1 : n_corners
            x = round(x_cur(1, j)) + 1;
            y = round(x_cur(2, j)) + 1;
            Z_d(j) = D_cur(y, x);
        end
        eval(['Z_d', num2str(i), ' = Z_d;']);
        plot(1:n_corners, Z_d, 'r+');
        ch = input('do you want to use it? (n = no, other = yes):', 's');
        if ch == 'n'
            is_active(i) = 0;
        else
            is_active(i) = 1;
        end
    end

    %   use golden section search
    favg = (fc(1) + fc(2))/2;
    %   search between [favg - 20, favg + 20]
    fmin = favg - 20;
    fmax = favg + 20;
    fa = [fmin; fmin];
    fb = [fmax; fmax];
    tau = (sqrt(5)-1)/2;
    x0 = fa + (1 - tau) * (fb - fa);
    x1 = fa + tau * (fb - fa);

    fc = x0;
    comp_primesense_energy;
    E0 = E_cur;

    fc = x1;
    comp_primesense_energy;
    E1 = E_cur;

    iter = 0;
    while fb(1) - fa(1) > 0.01
        if E0 >= E1
            fa = x0;
            x0 = x1;
            E0 = E1;
            x1 = fa + tau * (fb - fa);
            fc = x1;
            comp_primesense_energy;
            E1 = E_cur;
        else
            fb = x1;
            x1 = x0;
            E1 = E0;
            x0 = fa + (1 - tau) * (fb - fa);
            fc = x0;
            comp_primesense_energy;
            E0 = E_cur;
        end
        iter = iter + 1;
        disp('iter = ');
        disp(iter);
    end
    comp_primesense_energy;
    save('Opt_Results.mat', 'fc', 'cc', 'kc', 'alpha_c');
end

