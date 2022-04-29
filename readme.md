MatGrabber
=============

This project is a Windows-based MATLAB app for recovering screen contents of LCD monitors. Images are reconstructed after analysing the signals captured by a RSP1A Software-Defined Radio (SDR) device.

There are two modes in MatGrabber: File Mode and SDR Mode. The former one analyses the signals from audio files, while the latter one analyses the signals directly from the SDR device in real-time.

Credits
------------
The communication between MATLAB and RSP1A are managed with the help of two additional tools, which are as follows:
1. SDRuno <br />
https://www.sdrplay.com/sdruno/

2. SDRplay RSP2 Matlab Toolbox <br />
https://ww2.mathworks.cn/matlabcentral/fileexchange/67816-sdrplay-rsp2-matlab-toolbox
<br />
<br />

Installation
------------
1. Download MATLAB from the official MATLAB website (https://matlab.mathworks.com/).

2. Download SDRuno from the official SDRplay website (https://www.sdrplay.com/downloads/).

3. Install the API in the default location when downloading SDRuno (i.e. in "C:\Program Files\SDRplay").

4. Add the .dll/.lib path of the API in the in the Path Environment variables. (e.g. "C:\Program Files\SDRplay\API\x64" for 64-bit system).

5. Run the "Build_MEX.m" file in MATLAB to create the MEX file which enables communication between Matlab and the RSP.

6. Select the "Install App" button under "APPS" tab in MATLAB.

7. Select the "MatGrabber.mlappinstallin" file (inside the "Demo" folder) to install MatGrabber.
<br />
<br />

Installation Troubleshooting
------------
If there are errors when installing MatGrabber with the "MatGrabber.mlappinstallin" file, please create a new .mlappinstallin file with App Designer in MATLAB.

1. Open "MatGrabber.mlapp" with App Designer.

2. Select "Share > MATLAB App" under the "Designer" tab to open the "Package App" dialog box.

3. Select the "Demo" folder as the "Output folder" in the dialog box.

4. Select the "Package" button to create the .mlappinstallin file.

5. Install MatGrabber with the new "MatGrabber.mlappinstallin" file.
<br />
<br />

How does File Mode work?
------------
SDRuno is first used to create the audio file that is passed to File Mode for processing.
1. Click the "Play" button to search for the target signal.

2. Open the "Scheduler" function.

3. Click the "start recording" button to start recording the signal.

4. Click the "stop recording" button to save the recording as an audio file.
<br />
<br />

The following steps explains how to visualise the audio file in the "File Mode" of MatGrabber.
1. Click the "Browse" button in the "File Mode" of MatGrabber.

2. Select the audio file that was recorded with SDRuno.

3. Click the "Start" button to begin the signal processing.

4. Adjust the synchronous information and image position on the GUI.
<br />
<br />

How does SDR Mode work?
------------
The following steps explains how to visualise the data collected by RSP in the "SDR Mode" of MatGrabber.
1. Click the "Connect" button to establish a connection between RSP to MatGrabber.

2. Enter the sample rate, frequency, and bandwidth of the signal.

3. Click the "Start" button to begin the signal processing.

4. Adjust the synchronous information and image position on the GUI.

5. Click the "Stop" button to stop the signal processing.

6. Click the "Connect" button to disconnect RSP from MatGrabber.
<br />
<br />

Evaluation
------------
* report_evaluation_code.mlx: The code for final report's Sections 5.3.1 and 5.4.1

* testMatGrabber.m: The code for final report's Section 5.3.2
<br />
<br />

Further Questions?
------------
Feel free to contact me at hlleung74-c@my.cityu.edu.hk!