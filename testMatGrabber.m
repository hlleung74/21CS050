classdef testMatGrabber < matlab.uitest.TestCase
    properties
        app
        TestFile = 'Demo/recording.wav';
    end

    methods(TestClassSetup)
        % Shared setup for the entire test class
        function checkTestFiles(testCase)
            import matlab.unittest.constraints.IsFile
            testCase.assumeThat(testCase.TestFile,IsFile)
        end
    end

    methods(TestMethodSetup)
        % Setup for each test
        function launchApp(testCase)
            testCase.app = MatGrabber;
            testCase.addTeardown(@delete,testCase.app);
        end
    end

    methods(Test)
        % Test whether File Mode run correctly
        function test_FileMode(testCase)
            % Load file
            level = wildcardPattern + "/";
            filename = extractAfter(testCase.TestFile, asManyOfPattern(level));
            testCase.press(testCase.app.SearchFileButton);
            testCase.verifyEqual(testCase.app.FilePathField.Value,filename)

            % Unlock for adjustment
            matlab.uitest.unlock(testCase.app.UIFigure);
            testCase.press(testCase.app.FileModeStartButton);

            % Check whether the reconstructed object is displayed
            testCase.verifyNotEmpty(testCase.app.ReconstructedImage.Children)

            % Check whether objects are enabled correctly after processing
            testCase.verifyTrue(testCase.app.ModeSelectDropDown.Enable)
            testCase.verifyTrue(testCase.app.SearchFileButton.Enable)
            testCase.verifyTrue(testCase.app.FileModeStartButton.Enable)

            testCase.verifyFalse(testCase.app.RefreshRateSpinner.Enable)
            testCase.verifyFalse(testCase.app.WidthSpinner.Enable)
            testCase.verifyFalse(testCase.app.HeightSpinner.Enable)
            testCase.verifyFalse(testCase.app.FilterMagnitudeSpinner.Enable)

            testCase.verifyFalse(testCase.app.UpButton.Enable)
            testCase.verifyFalse(testCase.app.DownButton.Enable)
            testCase.verifyFalse(testCase.app.LeftButton.Enable)
            testCase.verifyFalse(testCase.app.RightButton.Enable)
        end

        % Test whether the texts/values are displayed correctly
        function test_InitTextDisplay(testCase)
            % Select File Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'File Mode');

            % File Mode
            testCase.verifyEqual(testCase.app.ModeSelectDropDown.Value, 'File Mode')
            testCase.verifyEqual(testCase.app.BrowseFileMessage.Text, 'Select pre-recorded file:')
            testCase.verifyEqual(testCase.app.SearchFileButton.Text, 'Browse')
            testCase.verifyEmpty(testCase.app.FilePathField.Value)
            testCase.verifyEqual(testCase.app.FileModeStartButton.Text, 'Start')

            testCase.verifyEqual(testCase.app.SDRConnectButton.Text, 'Connect')
            testCase.verifyEqual(testCase.app.ConnectionStatusLabel.Text, 'Not yet connected...')

            % Synchronous Information in File Mode
            testCase.verifyEqual(testCase.app.RefreshRateSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.HeightSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.WidthSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.FilterMagnitudeSpinner.Value, 0)

            % Select SDR Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'SDR Mode');

            % SDR Mode
            testCase.verifyEqual(testCase.app.ModeSelectDropDown.Value, 'SDR Mode')
            testCase.verifyEqual(testCase.app.ConnectSDRMessage.Text, 'Connect SDR device:')
            testCase.verifyEqual(testCase.app.SDRConnectButton.Text, 'Connect')
            testCase.verifyEqual(testCase.app.ConnectionStatusLabel.Text, 'Not yet connected...')
            testCase.verifyEqual(testCase.app.SampleRateMHzField.Value, 0)
            testCase.verifyEqual(testCase.app.FrequencyMHzField.Value, 0)
            testCase.verifyEqual(testCase.app.BandwidthField.Value, 0)
            testCase.verifyEqual(testCase.app.SDRModeStartButton.Text, 'Start')

            % Synchronous Information in SDR Mode
            testCase.verifyEqual(testCase.app.RefreshRateSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.HeightSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.WidthSpinner.Value, 0)
            testCase.verifyEqual(testCase.app.FilterMagnitudeSpinner.Value, 0)
        end


        % Test whether visibilities are set correctly
        function test_Visible(testCase)
            % Select File Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'File Mode');

            % File Mode
            testCase.verifyTrue(testCase.app.FileModePanel.Visible)
            testCase.verifyFalse(testCase.app.SDRModePanel.Visible)

            % Select SDR Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'SDR Mode');

            % SDR Mode
            testCase.verifyFalse(testCase.app.FileModePanel.Visible)
            testCase.verifyTrue(testCase.app.SDRModePanel.Visible)
            testCase.verifyEmpty(testCase.app.FilePathField.Value)

            % Axis
            testCase.verifyEmpty(testCase.app.ReconstructedImage.Children)
        end

        % Test whether the objects are enabled correctly
        function test_Enable(testCase)
            % Select File Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'File Mode');

            % File Mode
            testCase.verifyEqual(testCase.app.FileModePanel.Enable, 'on')
            testCase.verifyEqual(testCase.app.SDRModePanel.Enable, 'off')

            % Select SDR Mode
            testCase.choose(testCase.app.ModeSelectDropDown, 'SDR Mode');

            % SDR Mode
            testCase.verifyEqual(testCase.app.FileModePanel.Enable, 'off')
            testCase.verifyEqual(testCase.app.SDRModePanel.Enable, 'on')
            testCase.verifyFalse(testCase.app.FileModeStartButton.Enable)

            % Resulting Image Panel
            testCase.verifyFalse(testCase.app.UpButton.Enable)
            testCase.verifyFalse(testCase.app.DownButton.Enable)
            testCase.verifyFalse(testCase.app.LeftButton.Enable)
            testCase.verifyFalse(testCase.app.RightButton.Enable)
        end
    end

end