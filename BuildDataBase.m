    
    % For each scenario and each controller, this function stores the different operating signals as well
    % as the parameters of the control
    % => Reads the dataset of experimental data
    
function [const, signal, u_max] = BuildDataBase(file, cntrl_type, file_name)
    
    ii = 1;
    
    cd('Dataset/')
    
    
    % Build the database (signals + constants) into the Matlab workspace
    
    % 1/ List all *.dat file names
    
    % time
    file_print_time = strcat(file,'_','time.dat');
    FileName{ii} = file_print_time;
    ii = ii + 1;
    
    % Open-Loop max available lift
    file_print_BO_max_value = strcat(file,'_','BO_max_value.dat');
    FileName{ii} = file_print_BO_max_value;
    ii = ii + 1;
    
    % Open-Loop min available lift
    file_print_BO_min_value = strcat(file,'_','BO_min_value.dat');
    FileName{ii} = file_print_BO_min_value;
    ii = ii + 1;
    
    % output y observation filter
    file_print_y_filter_observation = strcat(file,'_','y_filter_observation.dat');
    FileName{ii} = file_print_y_filter_observation;
    ii = ii + 1;
    
    % control reference
    file_print_yc_effectif = strcat(file,'_','yc_effectif.dat');
    FileName{ii} = file_print_yc_effectif;
    ii = ii + 1;
    
    % MFC enable flag
    file_print_ModelFree_EN = strcat(file,'_','ModelFree_EN.dat');
    FileName{ii} = file_print_ModelFree_EN;
    ii = ii + 1;
    
    % MFC / Kp gain
    file_print_Kp = strcat(file,'_','Kp.dat');
    FileName{ii} = file_print_Kp;
    ii = ii + 1;
    
    % MFC / alpha_inv gain
    file_print_alpha_inv = strcat(file,'_','alpha_inv.dat');
    FileName{ii} = file_print_alpha_inv;
    ii = ii + 1;
    
    % MFC / PWM divider
    file_print_div_inv = strcat(file,'_','div_inv.dat');
    FileName{ii} = file_print_div_inv;
    ii = ii + 1;
    
    % MFC / u-signal
    file_print_u_MFC = strcat(file,'_','u_MFC.dat');
    FileName{ii} = file_print_u_MFC;
    ii = ii + 1;
    
    % MFC / max u-signal
    file_print_u_MFCmax = strcat(file,'_','u_MFCmax.dat');
    FileName{ii} = file_print_u_MFCmax;
    ii = ii + 1;
    
    % AST enable flag
    file_print_AST_EN = strcat(file,'_','AST_EN.dat');
    FileName{ii} = file_print_AST_EN;
    ii = ii + 1;
    
    % AST / dK1 gain
    file_print_dK1_st = strcat(file,'_','dK1_st.dat');
    FileName{ii} = file_print_dK1_st;
    ii = ii + 1;
    
    % AST / dK2 gain
    file_print_dK2_st = strcat(file,'_','dK2_st.dat');
    FileName{ii} = file_print_dK2_st;
    ii = ii + 1;
    
    % AST / PWM divider
    file_print_div_inv_st = strcat(file,'_','div_inv_st.dat');
    FileName{ii} = file_print_div_inv_st;
    ii = ii + 1;
    
    % AST / epsilon_0 const.
    file_print_epsilon_st = strcat(file,'_','epsilon_st.dat');
    FileName{ii} = file_print_epsilon_st;
    ii = ii + 1;
    
    % AST / Kint1 gain
    file_print_Kint_1_st = strcat(file,'_','Kint_1_st.dat');
    FileName{ii} = file_print_Kint_1_st;
    ii = ii + 1;
    
    % AST / Kint2 gain
    file_print_Kint_2_st = strcat(file,'_','Kint_2_st.dat');
    FileName{ii} = file_print_Kint_2_st;
    ii = ii + 1;
    
    % AST / mu gain
    file_print_mu_st = strcat(file,'_','mu_st.dat');
    FileName{ii} = file_print_mu_st;
    ii = ii + 1;
    
    % AST / vint-signal
    file_print_vint_st = strcat(file,'_','vint_st.dat');
    FileName{ii} = file_print_vint_st;
    ii = ii + 1;
    
    % AST / v-signal
    file_print_vv = strcat(file,'_','vv.dat');
    FileName{ii} = file_print_vv;
    ii = ii + 1;
    
    % AST / mu_0 gain
    file_print_mu_st0 = strcat(file,'_','mu_st0.dat');
    FileName{ii} = file_print_mu_st0;
    ii = ii + 1;
    
    % PID enable flag
    file_print_PI_control_EN = strcat(file,'_','PI_control_EN.dat');
    FileName{ii} = file_print_PI_control_EN;
    ii = ii + 1;
    
    % PID / Kd gain
    file_print_P_K_d = strcat(file,'_','P_K_d.dat');
    FileName{ii} = file_print_P_K_d;
    ii = ii + 1;
    
    % PID / Ki gain
    file_print_P_K_i = strcat(file,'_','P_K_i.dat');
    FileName{ii} = file_print_P_K_i;
    ii = ii + 1;
    
    % PID / Kp gain
    file_print_P_K_p = strcat(file,'_','P_K_p.dat');
    FileName{ii} = file_print_P_K_p;
    ii = ii + 1;
    
    % File name
    file_print_name = strcat(file,'_','name.dat');
    FileName{ii} = file_print_name;

    % Check if every file has been found
    for tt = 1:length(FileName)
    
        if ( isfile(FileName{tt}) == 0 )
            display('problem')
            pause
        end
    
    end
    
    % 2/ Load the data from each file
    
    ii = 1;
    
    % General settings
    time = load(FileName{ii});
 
    time = (time - time(1))/1000; % time is re-scaled from CubeMonitor
    ii = ii+1;
    BO_max_value = load(FileName{ii});
 
    ii = ii+1;
    BO_min_value = load(FileName{ii});
 
    ii = ii+1;
    y_filter_observation = load(FileName{ii});
 
    ii = ii+1;
    yc_effectif = load(FileName{ii});
 
    ii = ii+1;
    
    % MFC
    ModelFree_EN = load(FileName{ii});
 
    ii = ii+1;
    Kp= load(FileName{ii});
 
    ii = ii+1;
    alpha_inv = load(FileName{ii});
 
    ii = ii+1;
    div_inv = load(FileName{ii});
 
    ii = ii+1;
    u_MFC = load(FileName{ii});
 
    ii = ii+1;
    u_MFCmax = load(FileName{ii});
 
    ii = ii+1;
    
    % AST
    AST_EN = load(FileName{ii});
 
    ii = ii+1;
    dK1_st = load(FileName{ii});
 
    ii = ii+1;
    dK2_st = load(FileName{ii});
 
    ii = ii+1;
    div_inv_st = load(FileName{ii});
 
    ii = ii+1;
    epsilon_st = load(FileName{ii});
 
    ii = ii+1;
    Kint_1_st = load(FileName{ii});
 
    ii = ii+1;
    Kint_2_st = load(FileName{ii});
 
    ii = ii+1;
    mu_st = load(FileName{ii});
 
    ii = ii+1;
    vint_st = load(FileName{ii});
 
    ii = ii+1;
    vv = load(FileName{ii});
 
    ii = ii+1;
    mu_st0 = load(FileName{ii});
 
    ii = ii+1;
    
    % PID
    PI_control_EN = load(FileName{ii});
 
    ii = ii+1;
    P_K_d = load(FileName{ii});
 
    ii = ii+1;
    P_K_i = load(FileName{ii});
 
    ii = ii+1;
    P_K_p = load(FileName{ii});
 
    ii = ii+1;
    
    % File name
    fid = fopen(FileName{ii}, 'r');
 
    CC = textscan(fid, '%s');
    fclose(fid);
    const.FileName = string(CC{1});
    
    % 3/ Assign to the corresponding fields 'signal' and 'const'
    
    % General settings
    signal.time = time;
    const.BO_max_value = BO_max_value ;
    const.BO_min_value = BO_min_value;
    signal.y_filter_observation = y_filter_observation;
    signal.yc_effectif = yc_effectif ;
    
    % MFC
    const.ModelFree_EN = ModelFree_EN;
    const.Kp = Kp;
    const.alpha_inv = alpha_inv;
    const.div_inv = div_inv;
    signal.u_MFC = u_MFC;
    signal.u_MFCmax = u_MFCmax;
    
    % AST
    const.AST_EN = AST_EN;
    signal.dK1_st = dK1_st;
    signal.dK2_st = dK2_st;
    const.div_inv_st = div_inv_st;
    const.epsilon_st = epsilon_st;
    signal.mu_st0 = mu_st0;
    signal.Kint_1_st = Kint_1_st;
    signal.Kint_2_st = Kint_2_st;
    signal.mu_st = mu_st;
    signal.vint_st = vint_st;
    signal.vv = vv;
    
    % PID
    const.PI_control_EN = PI_control_EN;
    const.P_K_d = P_K_d;
    const.P_K_i = P_K_i;
    const.P_K_p = P_K_p;
    
    
    switch ( cntrl_type )
    
        case "_MFC"
            u_max = 4e8;
    
            fprintf('MFC - Control Parameters : \n');
            FileName = const.FileName
            Kp = const.Kp(end)
            alpha_inv = const.alpha_inv(end)
            div_inv = const.div_inv(end)
    
        case "_STW"
            u_max = 4e4;
    
            fprintf('STW - Control Parameters : \n');
            FileName = const.FileName
            div_inv_st = const.div_inv_st(end)
            epsilon_st = const.epsilon_st(end)
            mu_st0 = signal.mu_st0(end)
    
        case "PIDa"
            u_max = 4e3; %
    
            fprintf('PIDa - Control Parameters : \n');
            FileName = const.FileName
            P_K_d = const.P_K_d(end)
            P_K_i = const.P_K_i(end)
            P_K_p = const.P_K_p(end)
    
        case "PIDb"
            u_max = 4e3; %
    
            fprintf('PIDb - Control Parameters : \n');
            FileName = const.FileName
            P_K_d = const.P_K_d(end)
            P_K_i = const.P_K_i(end)
            P_K_p = const.P_K_p(end)
    
        case "PIDc"
            u_max = 4e3; %
    
            fprintf('PIDc - Control Parameters : \n');
            FileName = const.FileName
            P_K_d = const.P_K_d(end)
            P_K_i = const.P_K_i(end)
            P_K_p = const.P_K_p(end)
    
    end
    
    cd ..
    cd Results/
        
    if ( file_name ~= 0)
    
        % not used

    end
    
    cd ..
    
    % end of the function

