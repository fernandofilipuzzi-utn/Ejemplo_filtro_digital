% ejemplo: diymore_adc_dac_dma_filtro_int
% filipuzzi, fernando rafael
% fecha: 20211209
% matlab2021b

function [] = sim_disenio_filtro_iir_setting()

    %Filtro FIR - Pasa bajos - bilineal 
 	%Orden: 5
 	%Frecuencia de Corte: 15000 (Hz)
 	%Frecuencia de Muestreo: 100000 (Hz)
 	Fm=100000;
 	ORDEN=5;
 	coef_x= [0.04539057,0,0,0,0, ...
 			0];
 	coef_y= [-1,2.592371,-2.84657,1.639055,-0.491318, ...
 			0.0609166];

    hws = get_param('sim_disenio_filtro_iir', 'modelworkspace');

    hws.assignin('Fm', Fm);

    for n=0:8     

        if n< length(coef_x)
            hws.assignin(strcat('a',num2str(n) ), coef_x(n+1));
        else 
            hws.assignin(strcat('a',num2str(n) ), 0);
        end

        if (n+1)< length(coef_y)
            hws.assignin(strcat('b',num2str(n+1) ), coef_y(n+2));
        else 
            hws.assignin(strcat('b',num2str(n+1) ), 0);
        end

        if n>0
            hws.assignin(strcat('z',num2str(n+1),'_a'), Fm);
            hws.assignin(strcat('z',num2str(n+1),'_b'), Fm);
        end
        
    end

    limits=[1.0 , 2*pi*1000, 2*pi*Fm/2];
    set_param('sim_disenio_filtro_iir/dashboard/Slider1', 'Limits', limits);

end

