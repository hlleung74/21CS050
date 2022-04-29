classdef InputSignalViaFile < handle
    
    properties (Access = private)
        file_path
        signal
        sample_rate
        total_samples
    end

    methods
        function obj = InputSignalViaFile(file_path)
            obj.file_path = file_path;
            loadFile(obj);
        end

        % load the samples inside the audio file
        function loadFile(obj)
            [obj.signal, obj.sample_rate] = audioread(obj.file_path);
            obj.sample_rate = audioinfo(obj.file_path).SampleRate;
            obj.total_samples = audioinfo(obj.file_path).TotalSamples;
        end

        function signal = getSignal(obj)
            signal = obj.signal;
        end

        function sample_rate = getSampleRate(obj)
            sample_rate = obj.sample_rate;
        end

        function total_samples = getSampleNum(obj)
            total_samples = obj.total_samples;
        end
    end
end