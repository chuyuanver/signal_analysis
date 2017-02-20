function xlim_callback(h_obj, event, h_ax)

a = get(h_obj,'String');
b = str2num(a);
if length(b) == 2 && b(2)>b(1)
    xlim(h_ax,b);
end

if h_ax.Position(1) < 0.5
    global fid_cursor;
    cursor_callback(fid_cursor,event,h_ax);
else
    global ft_cursor;
    cursor_callback(ft_cursor,event,h_ax);
end
end