function autophase_callback(h_obj,event)
global ft_cursor;
global fourier_data;
global ax_ft;
global ft_xlim;
global reft_sum;
global ph_angle;
freq = fourier_data(1,:);
ft = fourier_data(2,:);
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

reft = real(ft(n1:n2));
imft = imag(ft(n1:n2));

phi = 1:360;
phi = phi/360 * (2*pi);

for k = 1:360
    x(k) = sum(cos(phi(k)) * reft + sin(phi(k)) * imft);
    y(k) = max(cos(phi(k)) * reft + sin(phi(k)) * imft);
end

[a,l] = max(x);
[a,m] = max(y);

if l == m
    set(ph_angle,'String',num2str(phi(l)/2/pi*360));
%     set(manualphase,'String',num2str(phi(l)/2/pi*360));
    realft = cos(phi(l)) * real(fourier_data(2,:)) + sin(phi(l)) * imag(fourier_data(2,:));
else
    set(ph_angle,'String',num2str(phi(m)/2/pi*360));
%     set(manualphase,'String',num2str(phi(m)/2/pi*360));
    realft = cos(phi(m)) * real(fourier_data(2,:)) + sin(phi(m)) * imag(fourier_data(2,:));
end
plot(ax_ft,freq,realft);
xlim_callback(ft_xlim,event,ax_ft);

reftsum = 2*sum(realft(n1:n2));
set(reft_sum,'String',num2str(reftsum));
ft_chop_callback(h_obj,event);

end