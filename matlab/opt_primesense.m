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
        %   plot the extracted corner depth information for this sample
        %   picture
        %   ideally, you should see a couple of parallel line segments in
        %   the plot because the corners are uniformly distributed in the
        %   chessboard, so there is a specific pattern for the depth
        %   information
        plot(1:n_corners, Z_d, 'r+');
        option = input('do you want to use it? ([] = yes):', 's');
        if isempty(option)
            is_active(i) = 1;
        else
            is_active(i) = 0;
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
    %   it will update the intrinsic parameters and store them in
    %   Opt_Results.mat
    save('Opt_Results.mat', 'fc', 'cc', 'kc', 'alpha_c');
    %   update Calib_Results_Left.mat
    clear all;
    load('calib_data_left.mat');
    load('Calib_Results_Left.mat');
    go_calib_optim;
    load('Opt_Results.mat');
    MaxIter = 0;
    go_calib_optim;
    saving_calib;
end

