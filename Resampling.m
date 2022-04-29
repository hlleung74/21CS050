classdef Resampling < handle
    
    methods
        % resample the signal from sample rate to pixel rate
        function out = process(~, in, pixel_rate, sample_rate)
            [upsamplingRate, downsamplingRate] = rat(pixel_rate/sample_rate);
            out = resample(in, upsamplingRate, downsamplingRate);
        end
    end
end