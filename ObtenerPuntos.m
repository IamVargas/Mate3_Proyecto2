% **************** DESCRIPCIÓN DEL ARCHIVO ****************
% ESTE ARCHIVO SIRVE PARA VISUALIZAR LA IMAGEN Y OBTENER   
% SUS PUNTOS                                               
% *********************************************************

RGB = imread('IMG.jpg');
Gr = rgb2gray(RGB);

figure(1)
imshow(edge(Gr,'sobel'))
title('Sobel')

figure(2)
imshow(edge(Gr,'prewitt'))
title('Prewitt')

figure(3)
imshow(edge(Gr,'roberts'))
title('Roberts')

figure(4)
imshow(edge(Gr,'log'))
title('Log')

figure(5)
imshow(edge(Gr,'canny')) % Mejor detección de bordes con este método, para este caso
title('Canny')

figure(6)
imshow(RGB)
title('A color')

imtool(edge(Gr,'canny'))

% Se copió la coordenada de cada pixel en un archivo de excel para
% posteriormente separar las filas y columnas en vectores filas gracias
% a código realizado en python, por mayor comodidad