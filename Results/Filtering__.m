    
    % function that creates a moving average filtering
    
    function yyy = Filtering__ ( U_vec , le_ , IC)
    
    end_fifo1a_ = IC* ones(1, le_ );
    
    for n=1:length( U_vec )
        
        x(n) = U_vec(n);
    
        [end_fifo1a_, out_data1a, sum_data] = Delay__(U_vec(n), end_fifo1a_); % MATLAB
    
        yyy(n) = sum_data;
    
    
    end
    
    end
    
    % end of the function