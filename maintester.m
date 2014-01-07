

clear, close all;
% Read the sample image in
    %i = imread('katy.jpg');
    %imshow katy.jpg;
    %colorbar('horiz');
    
    A = imread('katy4.jpg');
    subplot(2,2,1), imshow(A);
    I = rgb2ntsc(A);
    
    subplot(2,2,2), imshow(I);
    %colorbar('horiz');
    %imfinfo('katy.jpg');


    %imshow katy.jpg;
    %A = getimage;
    %image(A);

    %imshow katy.jpg;
    %[x, y, A, flag] = getimage;
    %image(A);
    %colorbar('horiz');
    %x
    %y
    %flag
    %help getimage
    %im = 
    % Find edges using the Canny operator with hysteresis thresholds of 0.1
    % and 0.2 with smoothing parameter sigma set to 1.
    G = rgb2gray(A);
    edgeim = edge(G,'canny', [0.1 0.2], 1);

    subplot(2,2,3), imshow(edgeim);