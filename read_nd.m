function[data] = read_nd(folder, filename, number)
% input: (folder, filename, number);
% output: data(x, y1, y2, y3, ...), length of data
% read binary file and shape it to two dimenstion

raw = read_1d(folder, filename);

l = length (raw);
h_l = l/(number+1);

data = reshape(raw,[number+1,h_l]);

end