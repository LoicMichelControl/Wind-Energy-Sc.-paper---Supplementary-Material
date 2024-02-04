    
    % function that creates a delay through a FIFO table
    
    function [end_fifo, out_data, sum_data] = Delay__(in_data, end_fifo)
    
    if ( length( end_fifo ) ~= 1 )
    
        end_fifo_l = length( end_fifo );
    
        for tt = 2:end_fifo_l
            end_fifo(tt-1) = end_fifo(tt);
        end
        end_fifo(end) = in_data;
    
        out_data = end_fifo(1);
    
        sum_data = sum( end_fifo  ) / length( end_fifo );
    
    else
    
        out_data = in_data;
    
    end
    
    end


    % end of the function