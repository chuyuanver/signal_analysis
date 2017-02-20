function wf_callback(h_obj,event)
global fid_work;
global ax_fid;
global window_select;
global fid;
ws = get(window_select,'Value');

if h_obj.Value == 1
    switch ws
        case 1
            t = fid_work(1,:);
            tau = t(end);
            wf = exp(-5*t./tau);
            fid_work(2,:) = fid_work(2,:).*wf;

        case 2
            l = length(fid_work);
            fid_work(2,:) = ifftshift(fid_work(2,:).*hann(l)');

        case 3
            l = length(fid_work);
            fid_work(2,:) = ifftshift(fid_work(2,:).*hamming(l)');

        case 4
            l = length(fid_work);
            fid_work(2,:) = ifftshift(fid_work(2,:).*blackman(l)');

    end
else
    fid_work = fid;
end

    plot(ax_fid,fid_work(1,:),fid_work(2,:));
    
end