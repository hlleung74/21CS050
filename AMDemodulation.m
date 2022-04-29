classdef AMDemodulation < handle
    methods
        % find the magnitude of the complex number
        function out = process(~, in, mode)
            if strcmp(mode, 'File')
                % the signal is stored as [I Q] format, where I and Q
                % are the real value and imaginary value respectively
                out = sqrt(in(:, 1).^2 + in(:, 2).^2);
            else
                % the signal is stored as [Ii+Qj] format, where I and Q
                % are the real value and imaginary value respectively
                out = abs(double(in));
            end
        end
    end
end