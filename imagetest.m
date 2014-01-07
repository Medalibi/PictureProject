cd /home/ich/research/omr


imshow levy.png;
colorbar('horiz');


A = imread('levy.png');

imshow(A);
colorbar('horiz');
imfinfo('levy.png');


imshow levy.png;
A = getimage;
image(A);

imshow levy.png;
[x, y, A, flag] = getimage;
image(A);
colorbar('horiz');
x
y
flag
help getimage

% Texture mapping
[x,y,z] = cylinder;
warp(x,y,z,A);
warp(x,y,z,rot90(A, 2));


B = imresize(A, 2);
imshow(B);

B = imresize(A, 0.3);
imshow(B);

B = imresize(A, [400 600]);
figure, imshow(B);

B = imrotate(A, 15);
figure, imshow(B);

F = figure;
imshow(A, [0 100])
imshow(A, [100 200])
H = imshow(A, [150 220])

get(H)  % Image property
get(F)  % Figure property
FC = get(F, 'Children');
get(FC)  % Axes property
AC = get(FC, 'Children')
I = get(AC) % Image property

HP = get(H, 'Parent');
get(HP) % Axes

%delete all figures

H = imshow(A);
AH = get(H, 'Parent');
set(AH, 'CLim', [150 200]);

figure, imshow(A);

figure, imshow(A > 100);
figure, imshow(A > 250);
figure, imshow(~(A > 250));
figure, imshow(A < 200);
figure, imhist(A);
figure, histeq(A);
figure, imshow(im2bw(A, 200 / 255));
figure, imshow(im2bw(A));
mean(A(:))
figure, imshow(im2bw(A, mean(A(:)) / double(max(A(:)))));


B = uint8(double(A) * 1.35);
figure, imhist(B);
figure, histeq(B);
figure, imhist(B);
imshow(im2bw(A, 195 / 255));
imshow(im2bw(A));
imadjdemo


% Convolutions & Filters
M = magic(5)
k = [0 0 1; 1 0 0; 0 1 0]
B = conv2(M, k, 'same')
h = rot90(k, 2)
C = filter2(h, M, 'same')

% Separability: rank == 1 (linearly independent rows/cols);
conv2(A, kcol, krow);

fspecial('average')
fspecial('unsharp')
fspecial('gaussian')
fspecial('laplacian')
fspecial('log')

h = fspecial('average', 3)
figure, imshow(uint8(round(filter2(h, A))));
h = fspecial('average', 7)
figure, imshow(uint8(round(filter2(h, A))));

h = fspecial('unsharp', 0.2)
figure, imshow(uint8(round(filter2(h, A))));
h = fspecial('unsharp', 0.9)
figure, imshow(uint8(round(filter2(h, A))));
h = fspecial('unsharp', 0.0)
B = uint8(round(filter2(h, A)));
figure, imshow(B);
figure, imshow(uint8(round(filter2(h, B))));
figure, imhist(B);
figure, imhist(A);

h = fspecial('gaussian', 5, 0.5)
figure, imshow(uint8(round(filter2(h, A))));
figure, freqz2(h, [32 32]);
colormap(jet(64));

h = fspecial('gaussian', 5, 5.0)
figure, imshow(uint8(round(filter2(h, A))));
figure, freqz2(h, [32 32]);

h = fspecial('laplacian', 0.2)
figure, imshow(uint8(round(filter2(h, A))));
h = fspecial('laplacian', 1.0)
figure, imshow(uint8(round(filter2(h, A))));

h = fspecial('log', 5, 0.5)
figure, imshow(uint8(round(filter2(h, A))));
h = fspecial('log', 5, 1.0)
figure, imshow(uint8(round(filter2(h, A))));


% Edge detection
A = imread('levysmall.png');
imshow(A);
bwSobel = edge(A, 'sobel');
bwPrewitt = edge(A, 'prewitt');
bwRoberts = edge(A, 'roberts');
bwLog = edge(A, 'log');
bwZerocross = edge(A, 'zerocross');
bwCanny = edge(A, 'canny');

figure, imshow(bwSobel);
figure, imshow(bwPrewitt);
figure, imshow(bwRoberts);
figure, imshow(bwLog);
figure, imshow(bwZerocross);
figure, imshow(bwCanny);
edgedemo

%nonlinear (rank) filter
B = imnoise(A, 'salt & pepper', 0.02);
C = medfilt2(B);
imshow(B);
figure, imshow(C);

nrfiltdemo

A = imread('levysmall.png');
imshow(A);

B = ordfilt2(A,5,ones(3,3)); % 3-by-3 median filter
figure, imshow(B);
B = ordfilt2(A,1,ones(3,3)); % 3-by-3 minimum filter
figure, imshow(B);
B = ordfilt2(A,9,ones(3,3)); % 3-by-3 maximum filter
figure, imshow(B);

% inline VERY slow use colfilt
f = inline('min(x(:))');
B = nlfilter(A,[3 3],f);
figure, imshow(B);

firdemo

B = imadjust(A, [0 220/255], [0 1], 1);
figure, imshow(B);

% Fourier and DCT transforms

A = imread('levysmall.png');
imshow(A);

% fast convolution
A = A < 190;
figure, imshow(A);
NH = A(84:96, 76:102);
figure, imshow(NH);
figure, imshow(NH, 'notruesize');
C = real(ifft2(fft2(A) .* fft2(rot90(NH,2), 168, 168)));
figure, imshow(C, []) 
max(C(:)) 
figure, imshow(C > 150)

% impovement
X = double(NH) * 2 - 1;
C = real(ifft2(fft2(A) .* fft2(rot90(X,2), 168, 168)));
figure, imshow(C, []) 
max(C(:)) %Find max pixel value in C.
figure, imshow(C > 130)

% slow convolution

Y = filter2(rot90(X,2), A, 'same');
figure, imshow(Y, [])

% Radon (projection)
[R, xp] = radon(A, 90);
figure, plot(R, xp);
[R, xp] = radon(A, 0);
figure, plot(xp, R);
[R, xp] = radon(A,45);
figure, plot(xp, R);


% Morphology
A = imread('levysmall.png');
A = A < 190;
imshow(A);
figure, imshow(erode(A, ones(3)), 'notruesize');
figure, imshow(erode(A, ones(5)), 'notruesize');
figure, imshow(erode(A, ones(7)), 'notruesize');

figure, imshow(dilate(A, ones(3)), 'notruesize');
figure, imshow(dilate(A, ones(5)), 'notruesize');
figure, imshow(dilate(A, ones(7)), 'notruesize');

figure, imshow(dilate(erode(A, ones(3)), ones(3)), 'notruesize');  %open

figure, imshow(bwmorph(A, 'open'), 'notruesize');
figure, imshow(bwmorph(A, 'close'), 'notruesize');
figure, imshow(bwmorph(A, 'thicken'), 'notruesize');
figure, imshow(bwmorph(A, 'thin'), 'notruesize');
figure, imshow(bwmorph(A, 'skel'), 'notruesize');
figure, imshow(bwmorph(A, 'skel', 2), 'notruesize');
figure, imshow(bwmorph(A, 'skel', 5), 'notruesize');
figure, imshow(bwmorph(A, 'skel', 6), 'notruesize');
figure, imshow(bwmorph(A, 'skel', inf), 'notruesize');

% Misc.
figure, imshow(bwperim(A), 'notruesize')
figure, imshow(bwfill(A, 'holes'), 'notruesize');

pixval
vals = impixel % left then right click

improfile   % draw line

imshow flowers.tif
improfile

% Feature
A = imread('levysmall.png');
imshow(A);
figure, imcontour(A)
A = A < 190;
figure, imcontour(A)

A = imread('levysmall.png');
imshow(A);
B = (A < 85);
figure, imshow(B);
imcontour(B);
[L, num] = bwlabel(B);
imshow(uint8(255 - L * 10));
pixval
stats = imfeature(L, 'all');
stats(2)
figure, imshow(stats(2).Image, 'notruesize');
figure, imshow(stats(2).FilledImage, 'notruesize')
figure, imshow(stats(2).ConvexImage, 'notruesize')
stats(4)
figure, imshow(stats(4).Image, 'notruesize');
figure, imshow(stats(4).FilledImage, 'notruesize')
figure, imshow(stats(4).ConvexImage, 'notruesize')



