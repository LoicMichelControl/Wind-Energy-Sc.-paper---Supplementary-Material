    
    switch ( type_ )
    
        case type_vec(1) % "vent_19.3";
    
            switch ( cntrl_type )
    
                case "_MFC"
    
                    %% *#13 - MFC vent @19.3*
    
                    path_ = 'MFC';
                    file = 'MFC_13a';
    
                case "_STW"
    
                    %% *#13 - STW vent @19.3*
    
                    path_ = 'STW';
                    file = 'STW_193';
    
                case "PIDa"
    
                    %% *#13 - PIDa vent @19.3*
    
                    path_ = 'PID';
                    file = 'PIDa_193';
    
    
                case "PIDb"
    
                    %% *#13 - PIDb vent @19.3*
    
                    file = 'PIDb_193';
    
    
                case "PIDc"
    
                    %% *#7b - PIDc vent @19.3*
    
                    path_ = 'PID';
                    file = 'PIDc_B_24';
    
            end
    
        case  type_vec(2) % "chopper_0.6pc";
    
            switch ( cntrl_type)
    
                case "_MFC"
    
                    %% *#6 - MFC chopper @5 cm*
    
                    path_ = 'MFC';
                    file = 'MFC_6';
    
    
                case "_STW"
    
                    %% *#6 - STW chopper @5 cm*
    
                    path_ = 'STW';
                    file = 'STW_B_6b';
    
                case "PIDa"
    
                    %% *#6 - PIDa chopper @5 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDa_B_4';
    
                case "PIDb"
    
                    %% *#6 - PIDb chopper @5 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDb_B_12';
    
                case "PIDc"
    
                    %% *#6 - PIDc chopper @5 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDc_B_20';
    
            end
    
        case type_vec(3) % "chopper_0.6pc_impact21.4";
    
            switch ( cntrl_type)
    
                case "_MFC"
    
                    %% *#11 - MFC chopper @5 cm et impact vent 21.4 @30s*
    
                    path_ = 'MFC';
                    file = 'MFC_B_11';
    
    
                case "_STW"
    
                    %% *#11 - STW chopper @5 cm et impact vent 21.4 @30s*
    
                    path_ = 'STW';
                    file = 'STW_B_11';
    
                case "PIDa"
    
                    %% *#11 - PIDa chopper @5 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDa_B_6';
    
    
                case "PIDb"
    
                    %% *#11 - PIDb chopper @5 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDb_B_14';
    
    
                case "PIDc"
    
                    %% *#11 - PIDc chopper @5 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDc_B_22';
    
            end
    
    
        case  type_vec(4) % "chopper_2.5pc_impact21.4";
    
            switch cntrl_type
    
                case "_MFC"
    
                    %% *#12 - MFC chopper @10 cm et impact vent 21.4 @30s*
    
                    path_ = 'MFC';
                    file = 'MFC_B_12';
    
                case "_STW"
    
                    %% *#12 - STW chopper @10 cm et impact vent 21.4 @30s*
    
                    path_ = 'STW';
                    file = 'STW_B_12b';
    
                case "PIDa"
    
                    %% *#12 - PIDa chopper @10 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDa_B_7';
    
                case "PIDb"
    
                    %% *#12 - PIDb chopper @10 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDb_B_15';
    
                case "PIDc"
    
                    %% *#12 - PIDc chopper @10 cm et impact vent 21.4 @30s*
    
                    path_ = 'PID';
                    file = 'PIDc_B_23';
    
            end
    
    
        case type_vec(5) % "chopper_2.5pc";
    
    
            switch (cntrl_type)
    
                %% *#7 - MFC chopper @10 cm (@30s)*
    
                case "_MFC"
    
                    path_ = 'MFC';
                    file = 'MFC_7a';
    
                case "_STW"
    
                    %% *#7 - STW chopper @10 cm (@30s)*
    
                    path_ = 'STW';
                    file = 'STW_7';
    
                case  "PIDa"
    
                    %% *#7 - PIDa chopper @10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDa_B_5';
    
                case "PIDb"
    
                    %% *#7 - PIDb chopper @10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDb_B_13';
    
                case "PIDc"
    
                    %% *#7 - PIDc chopper @10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDc_B_21';
    
            end
    
        case  type_vec(6) % "chopper_pm2.5pc";
    
    
            switch (cntrl_type)
    
                case  "_MFC"
    
                    %% *#7b - MFC chopper @+-10 cm (@30s)*
    
                    path_ = 'MFC';
                    file = 'MFC_7c';
    
                case "_STW"
    
                    %% *#7b - STW chopper @+-10 cm (@30s)*
    
                    path_ = 'STW';
                    file = 'STW_7b';
    
                case "PIDa"
    
                    %% *#7b - PIDa chopper @+-10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDa_B_5b';
    
                case "PIDb"
    
                    %% *#7b - PIDb chopper @+-10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDb_B_13b';
    
                case "PIDc"
    
                    %% *#7b - PIDc chopper @+-10 cm (@30s)*
    
                    path_ = 'PID';
                    file = 'PIDc_B_21b';
    
            end
    
    end

    % end of the script
    