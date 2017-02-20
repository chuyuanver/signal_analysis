function ft_chop_callback(h_obj,event)
global ft_cursor;
global fourier_data;
global ft_sum;
global ax_ft;
global h_snr;
global spec_max;
global h_fwhm;
global h_magint;
global wf_bt;
global window_select;

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

% magnitude integral
magint = sum(abs(ft(n1:n2)));
set(h_magint, 'String',num2str(magint));

% phase integral
re_sum = sum(real(ft(n1:n2)));
im_sum = sum(imag(ft(n1:n2)));
sig = (re_sum^2 + im_sum^2)^(1/2);
sig_converted = 2*sig;

if wf_bt.Value == 1 && window_select.Value > 1
    set(ft_sum,'String',num2str(sig_converted/2));
else
    set(ft_sum,'String',num2str(sig_converted));
end
% SNR in graph

x1 = ax_ft.XLim(1);
x2 = ax_ft.XLim(2);

if x1<cursor_value(1) && x2>cursor_value(2) && ...
        (cursor_value(2)-cursor_value(1)) < (x2-x1)/4
    n3 = finddata(x1,freq);
    n4 = finddata(x2,freq);
    noise_data = [ft(n3:n1) ft(n2:n4)];
    re_noise = std(real(noise_data));
    im_noise = std(imag(noise_data));
    noise = (re_noise^2 + im_noise^2)^(1/2);
    snr = sig/noise;
%     snr_db = 10*log10(snr);
    set(h_snr,'String',num2str(snr));
end

% max point
maximumpoint = max(abs(ft(n1:n2)));
set(spec_max,'String',num2str(maximumpoint));

% fwhm
dw = fwhm(freq(n1:n2),abs(ft(n1:n2)));
set(h_fwhm,'String',num2str(dw));


end
