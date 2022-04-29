% Simple script to determine the version of Matlab and build the MEX with 
% the corresponding SDRplay API.
%
% For any questions or assistance you can find me at, 
% vasathanasios@gmail.com.
%
% Athanasios Vasileiadis - 11/04/2021
%
% from https://ww2.mathworks.cn/matlabcentral/fileexchange/67816-sdrplay-rsp2-matlab-toolbox
 
if all(computer('arch') == 'win64')
    mex RSP_MEX.c 'C:\Program Files\SDRplay\API\x64\sdrplay_api.lib'
else 
    mex RSP_MEX.c 'C:\Program Files\SDRplay\API\x86\sdrplay_api.lib'
end 