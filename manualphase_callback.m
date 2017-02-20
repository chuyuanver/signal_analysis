function manualphase_callback(h_obj,event)
global ft_cursor;
global fourier_data;
global ax_ft;
global ft_xlim;
global reft_sum;
global ph_angle;

freq = fourier_data(1,:);
a = get(ft_cursor,'String');
cursor_value = str2num(a);

% check cursor value
if cursor_value(1) < cursor_value(2) && cursor_value(1)>= freq(1)...
        && cursor_value(2) <= freq(end)
    n1 = finddata(cursor_value(1),freq);
    n2 = finddata(cursor_value(2),freq);
else
    error('cursor value not valid')
end


phit = get(h_obj,'String');
phi = str2double(phit);
phi = phi/360 * (2*pi);

set(ph_angle,'String',num2str(phi/2/pi*360));
realft = cos(phi) * real(fourier_data(2,:)) + sin(phi) * imag(fourier_data(2,:));

plot(ax_ft,freq,realft);
xlim_callback(ft_xlim,event,ax_ft);

reftsum = 2*sum(realft(n1:n2));
set(reft_sum,'String',num2str(reftsum));
ft_chop_callback(h_obj,event);
end