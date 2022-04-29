classdef SyncDetection
    methods
        % make the off-center image stays in the center
        function out = process(obj, in, h_offset, v_offset)
            num_cols = width(in);
            num_rows = height(in);
            col_average = findColAverage(obj, in);
            row_average = findRowAverage(obj, in);
            out = shiftCol(obj, in, col_average, num_cols, num_cols*0.05, h_offset);
            out = shiftRow(obj, out, row_average, num_rows, num_rows*0.1, v_offset);
        end

        % find the average intensity for each column
        function col_average = findColAverage(~, in)
            col_average = mean(in);
        end

        % find the average intensity for each row
        function row_average = findRowAverage(~, in)
            row_average = mean(in,2);
        end

        % shift the columns of the image to the correct position
        function signal = shiftCol(obj, in, col_average, num_cols, blanking_cols, h_offset)
            num_shift = findBestStart(obj, col_average, num_cols, blanking_cols);
            signal = circshift(in,[0 -num_shift+h_offset]);
        end

        % shift the rows of the image to the correct position
        function signal = shiftRow(obj, in, row_average, num_rows, blanking_rows, v_offset)
            num_shift = findBestStart(obj, row_average, num_rows, blanking_rows);
            signal = circshift(in,[-num_shift+v_offset 0]);
        end

        % find the first column and row of the image
        function max_diff_id = findBestStart(~, arr, length, blanking_length)
            total_sum = sum(arr);

            stripsize = round(blanking_length);
            if stripsize < 1
                stripsize = 1;
            end
            bigstripsize = length - stripsize;

            curr_sum = sum(arr(1:stripsize));
            max_diff = ((total_sum - curr_sum)/bigstripsize - curr_sum/stripsize)^2;
            max_diff_id = 0;
            
            for current_id = 1:length-1
                remove_data = arr(current_id);
                    
                add_id = mod(current_id + stripsize, length);            
                if add_id == 0
                    add_id = add_id + 1;
                end
                add_data = arr(add_id);
                curr_sum = curr_sum - remove_data + add_data;
                diff = ((total_sum - curr_sum)/bigstripsize - curr_sum/stripsize)^2;
                if (diff > max_diff)
                    max_diff = diff;
                    max_diff_id = current_id;
                end
            end
        end
    end
end