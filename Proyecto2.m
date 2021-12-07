% **************** DESCRIPCIÓN DEL ARCHIVO ****************
% EN ESTA ARCHIVO SE COMPROBARÁ LA EFECTIVIDAD DE CADA     
% MÉTODO DE INTERPOLACIÓN ENSEÑADO EN CLASE POR EL PROFESOR
%                                                          
% SE PUEDE EVALUAR 1RO CON 9 PUNTOS, LUEGO CON 15 Y, PARA       
% FINALIZAR, CON 26 PUNTOS                                 
% *********************************************************

clear
clc

xx = 0:1:696;
img = imread('IMG.jpg'); % Lee la imagen
Interfaz = 'Cantidad de puntos para evaluar:\n[1] 9 puntos\n[2] 15 puntos\n[3] 26 puntos\n[0] Terminar\n';

opc = 1;
while opc > 0
    fprintf(Interfaz);
    opc = input('Ingrese opción: ');
    while opc < 0 || opc > 3
        fprintf('Opción incorrecta\n');
        opc = input('Ingrese opción: ');
    end
    if opc > 0 % Determina la cantidad de puntos a utilizar
        if opc == 1 % 9 puntos
            x = [0 44 99 170 293 397 535 657 696];
            y = [320 288 229 179 85 62 179 260 288];
        elseif opc == 2 % 15 puntos
            x = [1 46 99 146 192 223 280 321 399 459 503 571 623 672 696];
            y = [320 282 229 196 169 139 96 79 62 112 162 209 241 269 288];
        else % 26 puntos
            x = [1 38 60 99 149 176 192 202 250 269 294 303 321 346 398 ...
                417 454 493 535 595 597 623 639 650 678 696];
            y = [321 291 266 229 196 176 169 149 132 111 84 86 79 82 62 ...
                77 106 152 179 223 221 241 256 256 273 288];
        end
        % SE REALIZAN LOS CÁLCULOS PARA, POSTERIORMENTE, GRAFICAR
        % CADA POLINOMIO
        % Método de Lagrange
        L = lagrange(x,y);
        L_val = polyval(L,xx);
        % Método de Newton
        N = polynewton(x',y');
        N_val = polyval(N,xx);
        % Spline natural
        S = splinenatural(x,y);
        
        % SE GRAFICA CADA MÉTODO SOBRE LA IMAGEN PARA VISUALIZAR SU
        % PRECISIÓN
        % Con Lagrange
        figure(1)
        imshow(img)
        hold on
        plot(x,y,'og',xx,L_val,'r')
        legend('Nodos','Lagrange')
        hold off
        % Con Newton
        figure(2)
        imshow(img)
        hold on
        plot(x,y,'og',xx,N_val,'y')
        legend('Nodos','Newton')
        hold off
        % Con Spline natural
        figure(3)
        imshow(img)
        hold on
        plot(x,y,'og')
        graficarSplineNatural(S,x);
        grid on
        hold off
        
        % COMPARAMOS LAS GRÁFICAS DE LOS POLINOMIOS
        % Para ello, tenemos que volver a obtener los polinomios,
        % mas, esta vez, con las coordenas 'y' negativas
        L = lagrange(x,-y);
        L_val = polyval(L,xx);
        N = polynewton(x',-y');
        N_val = polyval(N,xx);
        S = splinenatural(x,-y);
        figure(4)
        hold on
        plot(x,-y,'og',xx,L_val,'r',xx,N_val,'y')
        graficarSplineNatural(S,x)
        grid on
        hold off
        legend('Nodos','Lagrange','Newton','Spline cúbico natural')
    end
end
fprintf('\n¡Gracias por utilizar el programa!\n');