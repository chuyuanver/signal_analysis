function plot_callback(h_obj, event)

global folder;
global filename;
global ax_fid;
global ax_ft;
global fid;
global zerofilling;
global fourier_data;
global fid_work;
global filter_bt;
global wf_bt;

set(filter_bt,'Value',0);
set(wf_bt,'Value',0);

% Read filename and folder name
folder_v = get(folder,'String');
filename_v = get(filename,'String');

% Read data in \folder\filename
fid = read_2d(folder_v, filename_v);


% Plot FID, x:time, y:induced V
fid_handle = plot(ax_fid, fid(1,:),fid(2,:));

% Transform FID into FT
l = length(fid(1,:));
N = 2^(zerofilling.Value-1);
ft = fft(fid(2,:),(N * l));
ft = 2*ft/(N*l);

% transfer zerofilling effect on the time domain -> freq domain
time = fid(1,:);
if N>1
    for k = 1:N-1
        time = [time (fid(1,:)+time(end)+time(2))];
    end
end
% Get appropriate x axis number(frequency)
freq = gui_t2freq(time);



% Plot FT
fourier_data = [freq;ft];
ft_handle = plot(ax_ft,freq,abs(ft));

% Set appropriate labels
set(ax_fid.XLabel,'String','time/s','FontSize',14);
set(ax_fid.YLabel,'String','U/V','FontSize',14);
set(ax_ft.XLabel,'String','freq/Hz','FontSize',14);
set(ax_ft.YLabel,'String','U/V','FontSize',14);

fid_work = fid;

%display average value
disp('Average value of time domain data is ');
disp(mean(fid(2,:)));
% fid_work(2,:) = fid(2,:).*exp(-0.5*fid(1,:));
end