function [ n ] = finddata( target,data )
%used to find time index in time/freq domain
%   use similar calculation,
%   input: target time, time domain

n = 1;
while ( abs(data(n) - target) > ( data(2)-data(1) )/1.9 )
    n = n+1;
end

end
