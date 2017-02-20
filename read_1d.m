function[data] = read_1d(folder,filename)
% input: (folder,filename);
% output: data
% read binary file for one dimenstion
cd (folder);

f = fopen (filename,'r','b');
data = fread (f,Inf,'double');
fclose (f);
end