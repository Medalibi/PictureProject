function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 25-Dec-2012 16:04:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Afficher.
function Afficher_Callback(hObject, eventdata, handles)
% hObject    handle to Afficher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
imshow(img);


% --- Executes on button press in extraction.
function extraction_Callback(hObject, eventdata, handles)
% hObject    handle to extraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
imshow(img);
whos;


% --- Executes on button press in niveaudegris.
function niveaudegris_Callback(hObject, eventdata, handles)
% hObject    handle to niveaudegris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img1);
title('image original');
subplot(1,2,2);
imshow(img);
title('image au niveau de gris');


% --- Executes on button press in detectioncontour.
function detectioncontour_Callback(hObject, eventdata, handles)
% hObject    handle to detectioncontour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
contour=edge(img,'sobel');
subplot(1,2,2);
imshow(contour);
title('contour detecté');


% --- Executes on button press in Histogrammeb.
function Histogrammeb_Callback(hObject, eventdata, handles)
% hObject    handle to Histogrammeb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
% img est l’image en niveau de gris
% On commence par initialiser une matrice d’une ligne et de 255 colonnes avec des zeros
 histo = zeros(1,255);
 % On parcours ensuite notre image
 for l=1:1:200;
 for c=1:1:150;
 % Et pour chaque pixel rencontré, on ajoute 1 pour sa valeur dans la matrice histo.
 histo(1,img(c,l)+1)=histo(1,img(c,l)+1)+1;
 end;
 end;
 subplot(1,2,2);
plot(histo);
title('Histogramme');


% --- Executes on button press in decompositionrgb.
function decompositionrgb_Callback(hObject, eventdata, handles)
% hObject    handle to decompositionrgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
imgR=img;
imgR( : ,:,2)=0;
imgR( :, :,3)=0;
subplot(3,1,1);
imshow(imgR);
imgG=img;
imgG( :, :,1)=0;
imgG( :, :,3)=0;
subplot(3,1,2);
imshow(imgG);
imgB=img;
imgB( :, :,1)=0;
imgB( :, :,2)=0;
subplot(3,1,3);
imshow(imgB);


% --- Executes on button press in Binarisation.
function Binarisation_Callback(hObject, eventdata, handles)
% hObject    handle to Binarisation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
% img est l’image en niveau de gris
otsu=graythresh(img);
bw=im2bw(img,otsu);
subplot(1,2,2);
imshow(bw);
title('binarisation manuelle');


% --- Executes on button press in Segmentation.
function Segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to Segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
% on récupère la taille de la matrice image
 [nbL,nbC] = size(img);
% Après visualisation de l’histogramme, on détermine les seuils
 s1 = 10;
 s2 = 15;
 s3 = 150;
 ga = imnoise(img,'gaussian');
 seg = img;
 segg = ga;
 for i=1:nbL
 for j=1:nbC
 if (img(i,j) < s1)
 seg(i,j) = 0;
 segg(i,j) = 0;
 elseif (img(i,j) > s1 && (img(i,j) < s2))
 seg(i,j) = 100;
 segg(i,j) = 100;
 elseif (img(i,j) > s2 && (img(i,j) < s3))
 seg(i,j) = 150;
 segg(i,j) = 150;
 else
 seg(i,j) = 192;
 segg(i,j) = 192;
 end
 end
 end
 subplot(1,2,2);
 imshow(seg);
 imshow(segg);
 title('image segmentée');


% --- Executes on button press in Gaussienb.
function Gaussienb_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussienb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
subplot(1,2,1);
imshow(img);
title('image original');
ga=imnoise(img,'gaussian');
subplot(1,2,2);
imshow(ga);
title('image avec bruit gaussien');


% --- Executes on button press in Poissonb.
function Poissonb_Callback(hObject, eventdata, handles)
% hObject    handle to Poissonb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
subplot(1,2,1);
imshow(img);
title('image original');
po=imnoise(img,'poisson');
subplot(1,2,2);
imshow(po);
title('image bruité suivant la loi de poisson');


% --- Executes on button press in poivreselb.
function poivreselb_Callback(hObject, eventdata, handles)
% hObject    handle to poivreselb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
subplot(1,2,1);
imshow(img);
title('image original');
ga=imnoise(img,'salt & pepper');
subplot(1,2,2);
imshow(ga);
title('image bruité suivant la loi de Poivre et Sel');


% --- Executes on button press in Gaussienf.
function Gaussienf_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussienf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(2,2,1);
imshow(img1);
title('image original');
subplot(2,2,2);
imshow(img);
title('image au niveau de gris');
ga=imnoise(img,'gaussian');
subplot(2,2,3);
imshow(ga);
title('image avec bruit gaussien');
mga=median(ga,3);
subplot(2,2,4);
imshow(mga);
title('image débruité');


% --- Executes on button press in Poissonf.
function Poissonf_Callback(hObject, eventdata, handles)
% hObject    handle to Poissonf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(2,2,1);
imshow(img1);
title('image original');
subplot(2,2,2);
imshow(img);
title('image au niveau de gris');
po=imnoise(img,'poisson');
subplot(2,2,3);
imshow(po);
title('image avec bruit poisson');
mpo=median(po,3);
subplot(2,2,4);
imshow(mpo);
title('image débruité');


% --- Executes on button press in poivreetself.
function poivreetself_Callback(hObject, eventdata, handles)
% hObject    handle to poivreetself (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(2,2,1);
imshow(img1);
title('image original');
subplot(2,2,2);
imshow(img);
title('image au niveau de gris');
ps=imnoise(img,'salt & pepper');
subplot(2,2,3);
imshow(ps);
title('image avec bruit sel et poivre');
mps=median(ps,3);
subplot(2,2,4);
imshow(mps);
title('image débruité');


% --- Executes on button press in Gaussiencouleur.
function Gaussiencouleur_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussiencouleur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
imshow(img);
title('image original');
ga=imnoise(img,'gaussian');
subplot(1,2,1);
imshow(ga);
title('image avec bruit gaussien');
k=fspecial('averag');
mga=imfilter(ga,k);
subplot(1,2,2);
imshow(mga);
title('image débruité');


% --- Executes on button press in Poissoncouleur.
function Poissoncouleur_Callback(hObject, eventdata, handles)
% hObject    handle to Poissoncouleur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
imshow(img);
title('image original');
po=imnoise(img,'poisson');
subplot(1,2,1);
imshow(po);
title('image avec bruit poisson');
l=fspecial('averag');
mpo=imfilter(po,l);
subplot(1,2,2);
imshow(mpo);
title('image débruité');


% --- Executes on button press in SeletPoivrecouleur.
function SeletPoivrecouleur_Callback(hObject, eventdata, handles)
% hObject    handle to SeletPoivrecouleur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
imshow(img1);
imshow(img);
ps=imnoise(img1,'salt & pepper');
subplot(1,2,1);
imshow(ps);
title('image avec bruit sel et poivre');
f=fspecial('averag');
mps=imfilter(ps,f);
subplot(1,2,2);
imshow(mps);
title('image débruité');


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
contour=edge(img,'sobel');
subplot(1,2,2);
imshow(contour);
title('contour detecté');


% --- Executes on button press in Canny.
function Canny_Callback(hObject, eventdata, handles)
% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
contour=edge(img,'Canny');
subplot(1,2,2);
imshow(contour);
title('contour detecté');


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=imread('katy4.jpg');
img=rgb2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
title('image au niveau de gris');
contour=edge(img,'Prewitt');
subplot(1,2,2);
imshow(contour);
title('contour detecté');


% --- Executes on button press in Wiener.
function Wiener_Callback(hObject, eventdata, handles)
% hObject    handle to Wiener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
subplot(1,2,1);
imshow(img);
title('image original');

% LEN et TETHA sont les paramètres de flou de la fonction fspecial
 LEN = 10;
 THETA = 50;
 % On détermine le filtre
 filtre = fspecial('motion',LEN,THETA);
 % Et on l’applique à notre image
 flou = imfilter(img, filtre, 'conv', 'circular');
 subplot(1,2,2);
 imshow(flou);
 title('Image flou');


% --- Executes on button press in Rotationimage.
function Rotationimage_Callback(hObject, eventdata, handles)
% hObject    handle to Rotationimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=imread('katy4.jpg');
figure;
subplot(1,3,1);
imshow(img);
imgRot1=imrotate(img,30,'bilinear','loose');
subplot(3,3,2);
imshow(imgRot1);
imgRot2=imrotate(img,30,'bilinear','crop');
subplot(1,3,3);
imshow(imgRot2);
