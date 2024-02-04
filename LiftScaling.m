    
    
    function [ Yc_F,  YF_F, Offset_general  ] = LiftScaling( YF_vec, YC_vec, max_YC)
    
    B = 1872;
    
    mag_y_direct = @(x)( 1.5* ( (10 - 100* (1000 * x / 3.3)) + 240 ) + 11500  );
    
    magnitude_y = @(Y_vec)( - 3.3 / ( 100* 1000 ) * ( ( Y_vec - 11500 ) / 1.5 - 240 - 10 ));
    
    
    
    for xx = -1e3:1e3
    
        if  1e-9 < ( abs( xx - magnitude_y ( mag_y_direct(xx) ) ) )
    
            display('eeeeeeeeeeeeeeeeeee');
            pause
    
        end
    
    
    end
    
    % coeff de conversion U / V
    Fu_conv = 1e-3 * 9.81 * B; %1192;
    
    % 1000 est fixé comme valeur de base de la consigne en BO -- RE-ENTREE de la consigne pour conversion en FORCE
    Offset_consigne_force = abs( Fu_conv * magnitude_y( 1000 ) );
    
    %  (int) 4096 * y_filter_observation / adapt_coeff;
    
    % Coeff. de ré-entrée dans la carte
    Cor_DAC = 1; %max_YC / 3.3;
    
    % mean_YF_vec = abs( mean( -Fu_conv*magnitude_y( Cor_DAC * YF_vec(delay_:end) ) ) );
    
    % RE-ENTREE de la consigne pour conversion en FORCE
    mean_YC_0 = Fu_conv*magnitude_y( Cor_DAC * YC_vec(1) );
    
    % ALIGNEMENT DE LA CONSIGNE EN BO POUR CORRECTION DE LA FORCE
    Offset_general = mean_YC_0 + Offset_consigne_force;
    
    % FORCE EQUIVALENTE DE LA CONSIGNE
    Yc_F = Fu_conv*magnitude_y( Cor_DAC * YC_vec );
    
    % FORCE EQUIVALENTE DU Y
    YF_F = Fu_conv*magnitude_y( Cor_DAC * YF_vec );
    
    
    % Capture de la consigne en BO ( valeur de 1000)
    
    %     index_consigne = max( find (Yc_F < 9) );
    %
    %     limit_consigne = time_( max( find (Yc_F < 9) ) );
    
    %     Yc_F (1 : max( find (Yc_F < 9) ) ) = 0;
    %
    %     % Moyenne en FORCE du signal Y brut
    %     mean_Y_force = mean ( Fu_conv*(Y_vec(delay_:end) ) );
    %
    %     % Limites d'affichage
    %     min_Y_display = min( YF_F ) - 0.5;
    %     max_Y_display = max( YF_F  ) + 0.5;
    %
    %     % filtrage du rapport-cyclique
    %     % yyy = Filtering ( U_vec );
    %
    %     yyy = Filtering__ ( U_vec, 10000 );
    
    end
    
    % end of function

