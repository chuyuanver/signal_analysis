# This is a matlab source code for visualizing the signal processing
# The main file is 'main_test7', and 7 means it is approximately the 7th version of this code
# After running the main program in matlab, a figure window will pop up and you can do various things on it. The first thing you need to do is to import the signal through folder and filename. It will read big_endian coded binary file under the 'filename' and the 'folder' that contains the file. After setting the appropriate folder and filename, click on 'Plot' and you should be able to see the signal right away. Data format should be [time;signal]. For example: [t0,t1,t2,t3,t4,t5;s0,s1,s2,s3,s4,s5].
# Initially, it will show your data on the left and the magnitude spectrum of the whole data on the right. 'Xlim' and 'Ylim' gives you the ability to change the limitation of the axis. The chop function on the left lets you to choose the fourier transform region. Filter gives you the ability to do a band-pass filtering of the data. Trim is a function in test yet. Window lets you to add a certain window function to your data. The zero filling means padding extra zeros after your data (operates differently when using window). Window/filter/trim are set so that the first click operates the functiona and second click restores the original signal.
# Ont the right, Xlim/Ylim are the same. Cursor lets you to choose the integration region. auto phase will also do zeroth order of phasing based on the cursor region you choose. Besides, phasing will also result in the change of the spectrum from magnitude to real. Manual phase allow you to set the phasing degree by yourself. The Various indications below are also based on the cursor region you choose.
# In addition, in case you want to give your signal from work space of matlab to the program, make sure your data is in the format of [time;signal]. In the work space type in : 
global fid_work; fid_work = your_data;
After that click on the chop to update the figures.
2/20/2017
