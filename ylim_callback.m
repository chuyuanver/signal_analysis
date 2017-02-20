function ylim_callback(h_obj, event, h_ax)

a = get(h_obj,'String');
b = str2num(a);
if length(b) == 2
    ylim(h_ax,b);
end

end