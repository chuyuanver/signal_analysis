function cursor_callback(h_obj, event,h_ax)

% delete previous lines
h = findall(gcf);

if h_ax.Position < 0.5
    delete(findobj(h,'Tag','fid_cursor1'));
    delete(findobj(h,'Tag','fid_cursor2'));
else
    delete(findobj(h,'Tag','ft_cursor1'));
    delete(findobj(h,'Tag','ft_cursor2'));  
end

a = get(h_obj,'String');
cursor_value = str2num(a);
lim_value = get(h_ax, 'XLim');

position = get(h_ax,'Position');
p_x = position(1);
p_y = position(2);
p_l = position(3);
p_h = position(4);
l1 = cursor_value(1)-lim_value(1);
l2 = cursor_value(2)-lim_value(1);
l = lim_value(2)-lim_value(1);

if cursor_value(1) < cursor_value(2)
    % left cursor
    if cursor_value(1) >= lim_value(1) && cursor_value(1)<= lim_value(2)
        x1 = [(l1/l)*p_l+p_x (l1/l)*p_l+p_x];
        y1 = [p_y p_y+p_h];
        cursor1 = annotation('line', x1, y1);
        cursor1.Color = 'Blue';
        if h_ax.Position < 0.5
            cursor1.Tag = 'fid_cursor1';
        else
            cursor1.Tag = 'ft_cursor1';       
        end
    end

    % right cursor
    if cursor_value(2) <= lim_value(2) && cursor_value(2) >= lim_value(1)
        x2 = [(l2/l)*p_l+p_x (l2/l)*p_l+p_x];
        y2 = [p_y p_y+p_h];
        cursor2 = annotation('line', x2, y2);
        cursor2.Color = 'Blue';
        if h_ax.Position < 0.5
            cursor2.Tag = 'fid_cursor2';
        else
            cursor2.Tag = 'ft_cursor2';       
        end
    end
end

end