classdef Reshape < handle

    % reshape signals from 1 by pixels_per_frame to frame_height by frame_width
    methods
        function out = process(obj, in, pixels_per_frame, frame_height, frame_width, filter_magnitude)
            in = in(1:pixels_per_frame);
            out = reshapeSignal(obj, in, frame_height, frame_width);
            out = gaussianFiltering(obj, out, filter_magnitude);
        end

        function reshaped_signal = reshapeSignal(~, in, frame_height, frame_width)
            reshaped_signal = reshape(in, [frame_width, frame_height])';
        end

        function filtered_signal = gaussianFiltering(~, in, filter_magnitude)
            filtered_signal = imgaussfilt(in, filter_magnitude, "Padding", 'circular');
        end
    end
end