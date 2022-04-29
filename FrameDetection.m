classdef FrameDetection < handle

    properties (Access = private, Constant)
        MAX_FRAMERATE = 87;
        MIN_FRAMERATE = 55;
        MAX_HEIGHT = 1500;
        MIN_HEIGHT = 540;
    end

    properties (Access = private)
        video_modes

        maxlength
        minlength
        max_heightlength
        min_heightlength

        sample_rate
        num_samples
        input_signal

        xcorr_signal
        lags

        refresh_rate
        frame_height
        frame_width
        pixel_rate
    end

    methods
        function obj = FrameDetection(sample_rate, input_signal, video_modes)
            obj.sample_rate = sample_rate;
            obj.video_modes = video_modes;
            initialise(obj);
            setNumSample(obj);
            obj.input_signal = input_signal(1:obj.num_samples-1);
            process(obj);
        end

        function obj = initialise(obj)
            obj.maxlength = obj.sample_rate / obj.MIN_FRAMERATE;
            obj.minlength = obj.sample_rate / obj.MAX_FRAMERATE;
            obj.max_heightlength = obj.sample_rate / (obj.MIN_HEIGHT * obj.MIN_FRAMERATE);
            obj.min_heightlength = obj.sample_rate / (obj.MAX_HEIGHT * obj.MAX_FRAMERATE);
        end

        % set the number of samples for frame detection to avoid
        % anti-aliasing
        function obj = setNumSample(obj)
            obj.num_samples = round(3.1*obj.sample_rate/obj.MIN_FRAMERATE);
        end

        function process(obj)
            findRefreshRate(obj);
            findFrameHeight(obj);
            findFrameWidth(obj);
            findPixelRate(obj);
        end

        % find the refresh rate with auto-correlation function
        function obj = findRefreshRate(obj)
            xcorrFunction(obj);
            pixel_num = getMaxLagWithRage(obj, obj.xcorr_signal, obj.maxlength, obj.minlength);
            obj.refresh_rate = obj.sample_rate/pixel_num;
        end

        % auto-correlation function
        function obj = xcorrFunction(obj)
            [c, obj.lags] = xcorr(obj.input_signal);
            obj.xcorr_signal = abs(c);
        end

        % find the number of horizontal lines in a frame with
        % auto-correlation function
        function obj = findFrameHeight(obj)
            lag = getMaxLagWithRage(obj, obj.xcorr_signal, obj.max_heightlength, obj.min_heightlength);
            obj.frame_height = round(obj.sample_rate/(lag*obj.refresh_rate));
        end

        % find the time lag with highest correlation coefficient
        function max_lag = getMaxLagWithRage(obj, signal, highestValue, lowestValue)
            desired_range = obj.lags <= highestValue & obj.lags >= lowestValue;
            signal_subset = signal(desired_range);
            lag_subset = obj.lags(desired_range);
            [~, max_corrcoef_index] = max(signal_subset);
            max_lag = lag_subset(1, max_corrcoef_index);
        end

        % find the number of vertical lines in a frame with refresh rate and number
        % of horizontal lines
        function obj = findFrameWidth(obj)
            extracted_rows_refresh = extractRowsWithClosetValue(obj, obj.video_modes, obj.refresh_rate, 3);
            extracted_rows_height = extractRowsWithClosetValue(obj, extracted_rows_refresh, obj.frame_height, 2);
            obj.frame_width = extracted_rows_height(1,1);
        end 

        function extracted_rows = extractRowsWithClosetValue(~, modes, referenceVal, compareColumnIndex)
            compareColumn = modes(:,compareColumnIndex);
            diff = abs(referenceVal - compareColumn);
            minimum = min(min(diff));
            [rows,~] = find(diff == minimum);
            extracted_rows = modes(rows, :);
        end

        % find the pixel frequency with refresh rate, and number of
        % horizontal and vertical lines in a frame
        function obj = findPixelRate(obj)
            obj.pixel_rate = obj.refresh_rate * obj.frame_height * obj.frame_width;
        end

        function refresh_rate = getRefreshRate(obj)
            refresh_rate = obj.refresh_rate;
        end

        function frame_height = getFrameHeight(obj)
            frame_height = obj.frame_height;
        end

        function frame_width = getFrameWidth(obj)
            frame_width = obj.frame_width;
        end
        
        function pixel_rate = getPixelRate(obj)
            pixel_rate = obj.pixel_rate;
        end
    end
end