%   Tao Du
%   taodu@stanford.edu
%   May 27, 2014

%   input: fc, is_active

%   output: E_cur

%   update the extrinsic parameters
for i = 1 : n_ima
    %   if the image is inactive, ignore it
    if (~is_active(i))
        continue;
    end
    eval(['x_ext=x_', num2str(i),';']);
    eval(['X_ext=X_', num2str(i),';']);
    [omc_ext,Tc_ext,Rc_ext,H_ext] = compute_extrinsic(x_ext,X_ext,fc,cc,kc,alpha_c);
    eval(['Tc_',num2str(i), '=Tc_ext;']);
    eval(['Rc_',num2str(i), '=Rc_ext;']);
end

E_cur = 0;
count = 0;
for i = 1 : n_ima
    %   if the image is inactive, ignore it
    if (~is_active(i))
        continue;
    end
    eval(['X_cur = X_', num2str(i), ';']);
    eval(['Rc_cur = Rc_', num2str(i), ';']);
    eval(['Tc_cur = Tc_', num2str(i), ';']);
    XXc = world_to_camera(X_cur, Rc_cur, Tc_cur);
    %   Z_ext is a vector contains the depth computed from the extrinsic
    %   parameters
    Z_ext = XXc(3, :);
    eval(['Z_dcur = Z_d', num2str(i), ';']);
    %   E_cur = \sum (Z_d - Z_ext)^2
    Z_logic = (Z_dcur == 0);
    Z_dcur(Z_logic) = [];
    Z_ext(Z_logic) = [];
    E_cur = E_cur + (Z_dcur - Z_ext) * (Z_dcur - Z_ext)';
    count = count + length(Z_ext);
    %   this is for visualization. You can comment out this plot line if
    %   you don't like it!
    %   Z_dcur represents the depth info from the PrimeSense
    %   Z_ext represents the depth info from the calibration
    %   and we want to adjust fc so that the difference between these two
    %   are minimized
    plot(1:length(Z_ext), Z_dcur, 'r+',...
        1:length(Z_ext), Z_ext, 'g+');
end
%   for debugging use only
%   you can safely comment out these disp lines
disp('fc = ');
disp(fc);
disp('distance difference for each corner on average: ');
disp(sqrt(E_cur / count));
