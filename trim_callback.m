function trim_callback(h_obj,event)
global shreshold;
global fid_work;
global ax_fid;
global fid_ylim; 
global fid;
if h_obj.Value == 1
    int = fid_work(2,:);
    avgint = mean(int);
    l = length(int);

    she = get(shreshold,'String');
    she = str2double(she);

    for k = 1:l
        if abs(int(k) - avgint) > she
            int(k) = avgint;
        end
    end

    fid_work(2,:) = int;

else
    fid_work = fid;
end
    plot(ax_fid,fid_work(1,:),fid_work(2,:));

    ylim_callback(fid_ylim,event,ax_fid);
