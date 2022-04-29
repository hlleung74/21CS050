classdef Modes < handle
    properties (Access = private)
        VideoModes
    end

    methods
        function obj = Modes()
            obj.VideoModes = zeros(79,3);
            contructModes(obj);
        end

        % the values are found from online
        % [w h r], where w is the frame width, h is the frame height, and
        % r is the refresh rate
        function obj = contructModes(obj)  
            obj.VideoModes(1, :) = [832 445 85];
            obj.VideoModes(2, :) = [936 446 85];
            obj.VideoModes(3, :) = [680 500 60];
            obj.VideoModes(4, :) = [848 509 100];
            obj.VideoModes(5, :) = [832 520 72];
            obj.VideoModes(6, :) = [840 500 75];
            obj.VideoModes(7, :) = [832 509 85];
            obj.VideoModes(8, :) = [976 597 60];
            obj.VideoModes(9, :) = [992 601 72];
            obj.VideoModes(10, :) = [1008 602 75];
            obj.VideoModes(11, :) = [1008 605 85];
            obj.VideoModes(12, :) = [1024 611 100];
            obj.VideoModes(13, :) = [1024 625 56];
            obj.VideoModes(14, :) = [1056 628 60];
            obj.VideoModes(15, :) = [1040 666 72];
            obj.VideoModes(16, :) = [1056 625 75];
            obj.VideoModes(17, :) = [1048 631 85];
            obj.VideoModes(18, :) = [1072 636 100];
            obj.VideoModes(19, :) = [1312 622 60];
            obj.VideoModes(20, :) = [1264 817 43];
            obj.VideoModes(21, :) = [1344 806 60];
            obj.VideoModes(22, :) = [1328 806 70];
            obj.VideoModes(23, :) = [1312 800 75];
            obj.VideoModes(24, :) = [1376 808 85];
            obj.VideoModes(25, :) = [1392 814 100];
            obj.VideoModes(26, :) = [1408 823 120];
            obj.VideoModes(27, :) = [1520 895 60];
            obj.VideoModes(28, :) = [1600 900 75];
            obj.VideoModes(29, :) = [1552 907 85];
            obj.VideoModes(30, :) = [1568 915 100];
            obj.VideoModes(31, :) = [1680 795 60];
            obj.VideoModes(32, :) = [1680 828 60];
            obj.VideoModes(33, :) = [1800 1000 60];
            obj.VideoModes(34, :) = [1728 1002 75];
            obj.VideoModes(35, :) = [1728 1011 85];
            obj.VideoModes(36, :) = [1760 1017 100];
            obj.VideoModes(37, :) = [1688 1066 60];
            obj.VideoModes(38, :) = [1688 1066 75];
            obj.VideoModes(39, :) = [1728 1072 852];
            obj.VideoModes(40, :) = [1760 1085 100];
            obj.VideoModes(41, :) = [1776 1097 120];
            obj.VideoModes(42, :) = [1800 795 60];
            obj.VideoModes(43, :) = [1880 1082 60];
            obj.VideoModes(44, :) = [1896 1094 72];
            obj.VideoModes(45, :) = [1896 1096 75];
            obj.VideoModes(46, :) = [1912 1103 85];
            obj.VideoModes(47, :) = [1928 1112 100];
            obj.VideoModes(48, :) = [1904 932 60];
            obj.VideoModes(49, :) = [1936 1087 60];
            obj.VideoModes(50, :) = [2144 1035 60];
            obj.VideoModes(51, :) = [2160 1044 75];
            obj.VideoModes(52, :) = [2176 1050 85];
            obj.VideoModes(53, :) = [2192 1059 100];
            obj.VideoModes(54, :) = [2144 1060 60];
            obj.VideoModes(55, :) = [2176 1069 75];
            obj.VideoModes(56, :) = [2096 1070 76];
            obj.VideoModes(57, :) = [2176 1075 85];
            obj.VideoModes(58, :) = [2160 1250 60];
            obj.VideoModes(59, :) = [2160 1250 65];
            obj.VideoModes(60, :) = [2160 1250 70];
            obj.VideoModes(61, :) = [2160 1250 75];
            obj.VideoModes(62, :) = [2160 1250 85];
            obj.VideoModes(63, :) = [2208 1271 100];
            obj.VideoModes(64, :) = [1840 1080 60];
            obj.VideoModes(65, :) = [2240 1089 60];
            obj.VideoModes(66, :) = [2256 1087 60];
            obj.VideoModes(67, :) = [2448 1394 60];
            obj.VideoModes(68, :) = [2456 1417 75];
            obj.VideoModes(69, :) = [2528 1439 60];
            obj.VideoModes(70, :) = [2560 1500 75];
            obj.VideoModes(71, :) = [2576 1125 60];
            obj.VideoModes(72, :) = [2608 1126 75];
            obj.VideoModes(73, :) = [2592 1242 60];
            obj.VideoModes(74, :) = [2624 1253 75];
            obj.VideoModes(75, :) = [2600 1500 60];
            obj.VideoModes(76, :) = [2640 1500 75];
            obj.VideoModes(77, :) = [2048 2434 25];
            obj.VideoModes(78, :) = [2044 2434 30];
            obj.VideoModes(79, :) = [2800 1589 60];
        end

        function video_modes = getVideoModes(obj)
            video_modes = obj.VideoModes;
        end
    end
end