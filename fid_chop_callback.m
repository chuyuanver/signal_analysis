function fid_chop_callback(h_obj ,event)
global fid_cursor;
global fid_work;
global ax_ft;
global ax_fid;
global zerofilling;
global fourier_data;
global ft_xlim;
global fid_xlim;
global window_select;
global wf_bt;

time = fid_work(1,:);
amp = fid_work(2,:);
a = get(fid_cursor,'String');
cursor_value = str2num(a);

% check cursor value and give reasonable cursor values when set out of limit  


if cursor_value(1) < cursor_value(2)
    if cursor_value(1) < time(1)
        n1 = 1;
    else
        n1 = finddata(cursor_value(1),time);
    end
    
    if cursor_value(2) > time(end)
        n2 = length(time);
    else
        n2 = finddata(cursor_value(2),time);
    end
    
else
    error('cursor value not valid')
end



time_new = time(n1:n2);
amp_new = amp(n1:n2);
% Transform FID into FT
l = length(time_new);
N = 2^(zerofilling.Value-1);

% consider symmetric window function 
if wf_bt.Value == 1 && window_select.Value > 1
    ft = fft([amp_new(1:floor(end/2)),zeros(1,N*l-l),amp_new(floor(end/2)+1:end) ]);
else
    ft = fft(amp_new, (N * l));
end

% debug
% length(ft)

% change normalized ft back to real value
ft = 2*ft/(N*l);
% transfer zerofilling effect on the time domain -> freq domain
time_new_zf = time_new;
if N>1
    for k = 1:N-1
        time_new_zf = [time_new_zf (time_new + time_new_zf(end) - time_new_zf(1)+time(2))];
    end
end
% Get appropriate x axis number(frequency)
freq = gui_t2freq(time_new_zf);

% debug
% length(freq)


fourier_data = [freq;ft];

% plot real spectrum instead of ft spectrum and do phasing automatically
ft_handle = plot(ax_ft,freq,abs(ft));
% plot(ax_ft,freq,real(ft));

xlim_callback(ft_xlim,event,ax_ft);

plot(ax_fid,fid_work(1,:),fid_work(2,:));
xlim_callback(fid_xlim,event,ax_fid);
set(ax_fid.XLabel,'String','time/s','FontSize',14);
set(ax_fid.YLabel,'String','U/V','FontSize',14);
set(ax_ft.XLabel,'String','freq/Hz','FontSize',14);
set(ax_ft.YLabel,'String','U/V','FontSize',14);


end