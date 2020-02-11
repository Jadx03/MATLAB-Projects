a = xlsread ("acceleration.xlsx")
t = xlsread ( "time.xlsx")


plot(t,a);
legend('X','Y', 'Z');
xlabel('Relative Time (seconds)');
ylabel('Acceleration (m/s^2)');

% create a single vector that is the next length of X,Y and Z
% note that the "2" in the equation is to tell MATLAB the data is in
% columns.  The dot is to do the squaring element-wise.
x=a(:,1);
y=a(:,2);
z=a(:,3);
mag=sqrt(sum(x.^2 + y.^2 + z.^2, 2));
 
% now plot magnitude
 
plot (t, mag);
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');

magTheo=mag-9.8;
plot(t, magTheo);
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');

% Start with a minimum height to count, so you don’t count noise.
minPeakHeight=std(magTheo);  % uses the standard deviation as a min
% now the signal processing toolbox is used to find peaks.  
 [pks,locs]=findpeaks(magTheo, 'MINPEAKHEIGHT', minPeakHeight);
% this is a function that returns the peak height and its location in X
% count the result
numSteps=numel(pks); % asks how many elements there are in ”pks” 
 
% now make a nice plot
hold on
plot(t(locs), pks, 'r', 'Marker', 'v', 'LineStyle', 'none');
xlabel('Acceleration Magnitude, No Gravity (m/s^2)');
hold off

