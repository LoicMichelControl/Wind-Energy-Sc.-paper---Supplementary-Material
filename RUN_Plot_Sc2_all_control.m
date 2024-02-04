
% Supplementary Material — Some comments on experimental results of three lift controllers for a wind turbine blade section using an active flow control

% Loic Michel, Caroline Braud, Jean-Pierre Barbot, Franck Plestan, Dimitri Peaucelle and Xavier Boucher  

% ==== Matlab scripts and dataset ====


% This script plots the time evolution of each controller with respect to
% the Sc #2 that has been chosen to illustrate the control properties.
% => Plot of the Figs. 8 - 12 and the Figs. 15 - 18.


clear all
close all
clc

iii = 1;

%%%%%%%%%%%%%%%%%%%%%%%
% Sc #2 - MFC

path_ = 'MFC';
file = 'MFC_6';

commande = "_MFC"

[const, signal] = BuildDataBase( file, path_, 0);

FileName    = const.FileName
Kp          = const.Kp(end)
alpha_inv   = const.alpha_inv(end)
div_inv     = const.div_inv(end)

            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%

iii = PlotSignals(1, signal.time, Fconversion(Yc_F), Fconversion(YF_F),  signal.u_MFC,  iii,  commande );

%%%%%%%%%%%%%%%%%%%%%%%
% Sc #2 - AST

path_ = 'STW';
file = 'STW_B_6b';

commande = "_STW"

[const, signal] = BuildDataBase( file, path_, 0);

FileName = const.FileName
div_inv_st = const.div_inv_st(end)
epsilon_st = const.epsilon_st(end)
mu_st0 = signal.mu_st0(end)

            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%

iii = PlotSignals(1, signal.time, Fconversion(Yc_F), Fconversion(YF_F),  signal.u_MFC,  iii,  commande );
 
%%%%%%%%%%%%%%%%%%%%%%%
% Sc #2 - PIDa

path_ = 'PID';
file = 'PIDa_B_4';

commande = "PIDa"

[const, signal] = BuildDataBase( file, path_, 0);

FileName = const.FileName
P_K_d = const.P_K_d(end)
P_K_i = const.P_K_i(end)
P_K_p = const.P_K_p(end)

            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%

iii = PlotSignals(1, signal.time, Fconversion(Yc_F), Fconversion(YF_F),  signal.u_MFC,  iii,  commande );

%%%%%%%%%%%%%%%%%%%%%%%
% Sc #2 - PIDb

path_ = 'PID';
file = 'PIDb_B_12';

commande = "PIDb"

[const, signal] = BuildDataBase( file, path_, 0);

FileName = const.FileName
P_K_d = const.P_K_d(end)
P_K_i = const.P_K_i(end)
P_K_p = const.P_K_p(end)

            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%

iii = PlotSignals(1, signal.time, Fconversion(Yc_F), Fconversion(YF_F),  signal.u_MFC,  iii,  commande );

%%%%%%%%%%%%%%%%%%%%%%%
% Sc #2 - PIDc

path_ = 'PID';
file = 'PIDc_B_20';

commande = "PIDc"

[const, signal] = BuildDataBase( file, path_, 0);

FileName = const.FileName
P_K_d = const.P_K_d(end)
P_K_i = const.P_K_i(end)
P_K_p = const.P_K_p(end)

            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%

iii = PlotSignals(1, signal.time, Fconversion(Yc_F), Fconversion(YF_F),  signal.u_MFC,  iii,  commande );

close all


% End of the script
