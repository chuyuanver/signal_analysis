function filter_callback(h_obj,event)
    global fid;
    global filter_band;
    global ax_fid;
    global fourier_data;
    global fid_work;
    
if h_obj.Value == 1

    ft = fourier_data(2,:);
    freq = fourier_data(1,:);
    l = length(freq);

    passband = get(filter_band,'String');
    passband = str2num(passband);
    lowpass = passband(1);
    highpass = passband(2);

    maxfreq = freq(end)/2;

    n_lowp = lowpass/maxfreq;
    n_highp = highpass/maxfreq;
    % order of filter
    filter_order = 4;

    % correct magnitude of plot
    low_freq = finddata(lowpass, freq);
    high_freq = finddata(highpass, freq);
    magnitude = max(abs(ft(low_freq:high_freq)));
    %

    [b,a] = butter(filter_order,[n_lowp n_highp],'bandpass');

    H = freqz(b,a,floor(l/2));
    figure(2);
    ax_freq_raw = 0:1/(floor(l/2)-1):1;
    ax_freq = ax_freq_raw * maxfreq;
    plot(ax_freq,abs(ft(1:floor(l/2)))/magnitude);
    hold on;

    plot(ax_freq,abs(H),'r');
    hold off;
    xlim([lowpass-1000 highpass+1000]);
    % ylim([0 200*mean(abs(ft))]);
    fid_work(2,:) = filter(b,a,fid_work(2,:));


    figure(1);
    plot(ax_fid,fid_work(1,:),fid_work(2,:));

else
    fid_work = fid;
    figure(1);
    plot(ax_fid,fid_work(1,:),fid_work(2,:));
end