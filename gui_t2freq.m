function [ freq ] = gui_t2freq( time )
%take time from fid and transform to appropriate freqency
%   take length of frequency the same as time

ts = time(end)-time(1);
tl = length(time);
dt = ts/tl;
fs = 1/dt;
fl = tl;
df = fs/fl;
freq = 0:df:fs-dt;

end

