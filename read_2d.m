function[data] = read_2d(folder, filename)
% input: (folder, filename);
% output: data(x, y), length of data
% read binary file and shape it to two dimenstion

[data] = read_nd(folder, filename, 1);

end