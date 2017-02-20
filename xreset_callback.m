function xreset_callback(h_obj, event, h_ax)
global fid_cursor;
global ft_cursor;

    
xlim(h_ax,'auto');
if h_ax.Position(1) < 0.5
    cursor_callback(fid_cursor,event,h_ax);
else
    cursor_callback(ft_cursor,event,h_ax);
end