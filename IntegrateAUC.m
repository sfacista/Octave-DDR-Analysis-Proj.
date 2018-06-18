clc %this clears the command window
1; %not a function file - that's all this line is in here for
%Drug name = trametinib in this example
%On 6/7/2018 I altered this script to only include things from P1-14, this
%means that the last 24 columns from the matrix to follow were excluded...
%this is shown where for "end" values you see the value "56"
testmatrixtram = [26.14	31.14	21.61	24.83	19.99	30.17	21.04	21.79	21.5	32.02	21.47	24.98	28.11	38.49	31.42	32.29	22.08	26.22	24.09	23.88	26.02	24.75	29.48	28.66	24.15	23.99	23.43	25.49	21.34	22.52	25.94	25.53	24.85	17.78	26.29	24.9	26.09	23.75	22.61	20.53	23.54	23.65	22.44	20.79	29.29	23.74	26.89	24.66	23.4	23.56	25.17	22.04	23.07	23.17	27.97	15.91	24.27	23.34	25.71	23.2	27.38	29.56	27.86	25.76	22.61	24.41	29.52	29.45	20.34	28.08	24.51	23.57	21.34	22.52	25.94	25.53	18.13	15.28	35.21	22.6;
96.9	100	99.74	100	100	100	100	100	100	98.91	100	98.26	100	100	100	100	100	100	100	100	100	100	100	100	100	98.22	100	100	100	100	100	100	100	100	100	100	100	100	100	100	92.92	100	100	98.5	100	100	100	100	98.46	100	100	100	100	100	100	94.08	100	100	100	100	100	100	100	100	91.92	99.52	100	100	100	100	100	100	100	100	100	100	98.84	100	100	99.8;
-3.013	-2.876	-3.144	-3.043	-3.301	-3.185	-3.242	-3.2	-3.087	-2.911	-2.591	-2.42	-3.255	-3.071	-2.767	-2.356	-2.966	-2.837	-2.375	-2.129	-3.041	-2.676	-2.235	-2.097	-2.851	-2.594	-2.301	-1.801	-3.058	-2.391	-2.464	-2.344	-2.812	-1.741	-2.23	-2.033	-2.954	-2.149	-2.453	-2.228	-3.033	-2.254	-2.638	-2.439	-2.95	-2.013	-2.338	-2.019	-3.053	-2.153	-2.4	-2.175	-2.865	-1.861	-2.05	-2.014	-2.724	-2.003	-2.105	-1.958	-2.861	-1.965	-1.889	-1.97	-2.563	-1.712	-1.804	-1.664	-3.018	-2.113	-2.331	-2.202	-3.058	-2.391	-2.464	-2.344	-2.895	-2.146	-1.913	-2.045;
-2.215	-1.446	-1.93	-2.505	-3.137	-2.043	-2.962	-2.266	-1.308	-1.169	-1.157	-1.241	-1.826	-1.342	-1.514	-1.479	-4.681	-2.196	-2.044	-2.242	-3.187	-1.337	-1.85	-2.327	-3.632	-1.311	-1.757	-2.175	-3.103	-1.626	-2.046	-2.187	-2.888	-1.863	-2.367	-1.915	-4.942	-2.064	-2.209	-1.973	-4.945	-2.369	-2.781	-2.593	-2.66	-3.181	-1.882	-2.26	-3.164	-3.004	-3.241	-2.253	-2.275	-2.761	-3.712	-1.459	-5.691	-3.871	-3.044	-2.817	-2.454	-3.697	-3.24	-2.234	-2.443	-1.56	-2.034	-2.039	-4.052	-2.641	-1.704	-1.688	-3.103	-1.626	-2.046	-2.187	-2.712	-1.51	-3.006	-1.195];
%testarray is the data matrix that we are using to define all the variables. The rows are defined below in the for loop. 
%Note the space delineated format with each row (excepting the last) terminated by a semicolon. The matrix is flanked by square brackets.

%begin section of script using for determining the mean and standard
%deviation of IC50's for the purpose of excluding those which high z
%scores.
%IC50foravg = [0.00097	0.00133	0.0007182	0.0009057	0.0005	0.0006533	0.0005732	0.0006304	0.0008185	0.001228	0.002566	0.003802	0.0005553	0.0008485	0.001712	0.004409	0.001082	0.001455	0.004218	0.007437	0.0009103	0.00211	0.00582	0.007996	0.001408	0.00255	0.005	0.01582	0.0008747	0.004067	0.003432	0.004532	0.001543	0.01814	0.00589	0.009264	0.001113	0.007096	0.003527	0.005915	0.0009276	0.005572	0.002303	0.003637	0.001121	0.009711	0.004592	0.009562	0.0008858	0.007029	0.003983	0.006685	0.001364	0.01377	0.008916	0.009689	0.001888	0.00994	0.007843	0.01102	0.001377	0.01083	0.0129	0.01073	0.002737	0.0194	0.0157	0.02168	0.0009584	0.007714	0.004665	0.006276	0.0008747	0.004067	0.003432	0.004532	0.001273	0.007146	0.01221	0.009012];
%IC50foravgV = IC50foravg(1:4:end);
%IC50foravgT1 = IC50foravg(2:4:end);
%IC50foravgT3 = IC50foravg(3:4:end);
%IC50foravgT5 = IC50foravg(4:4:end);

%avgIC50V = mean(IC50foravgV);
%avgIC50T1 = mean(IC50foravgT1);
%avgIC50T3 = mean(IC50foravgT3);
%avgIC50T5 = mean(IC50foravgT5);

%stdevsIC50V = std(IC50foravgV,0);
%stdevsIC50T1 = std(IC50foravgT1,0);
%stdevsIC50T3 = std(IC50foravgT3,0);
%stdevsIC50T5 = std(IC50foravgT5,0);

%zscoreV = abs(IC50foravgV-avgIC50V) ./ stdevsIC50V
%zscoreT1 = abs(IC50foravgT1-avgIC50T1) ./ stdevsIC50T1
%zscoreT3 = abs(IC50foravgT3-avgIC50T3) ./ stdevsIC50T3
%zscoreT5 = abs(IC50foravgT5-avgIC50T5) ./ stdevsIC50T5
    
%end section of script used for finding mean and stddev.s



intarrayt = zeros(1,56);%this is the array to which the data is going to be saved. We predefine the space for the array here.
for i=1:56%6/7/2018 I edited the original i to be from 1:56 instead of 1:size(testmatrixtram,2) %Matlab runs for loops processing column by column. We just set i so that it runs from column 1 to column (last column) - for which we are able to use the size function to determine the size of the matrix (note that the second argument for size is to find either row or column).
  Bottom    = testmatrixtram(1,i); %these lines define the variables in each column, as the for loop iterates through the matrix, column by column, it uses these definitions.
  Top       = testmatrixtram(2,i);
  LogIC50   = testmatrixtram(3,i);
  HillSlope = testmatrixtram(4,i);
   intarrayt(i) = quadgk (@(x)Bottom+((Top-Bottom) ./(1+10 .^((LogIC50-x).*HillSlope))),-2.60933,-1.41867);
    %quadgk is the function we are choosing to use to integrage the area between the curve. Note that the function uses matrix math, so there are "."'s in front of some of the normal atrithmatic operators. 
    %You should also note the form of the function with @ specifying an anonymous function "x" preceeding the function. The last two values separated by commas are the limits (funct,lower limit,upper limit).
    
end
%here until comment BZKRT used to create plot to estimate best limits
meanbot   = mean(Bottom);
meantop   = mean(Top);
meanlogic = mean(LogIC50);
meanhs    = mean(HillSlope);

%comments added for my own record 6/11/2018: we want to integrate the curve
%from areas starting where the line tangent to the inflection point of the
%sigmoidal curve touches the mean top line on the left and the mean bottom
%on the right. 
%We need inflection point (point where second derivative is 0), slope of 
%the tangent line (solve for first derivative)
syms x;
f = meanbot+(meantop-meanbot)/(1+10^((meanlogic-x)*meanhs));
%fplot(f)
f1=diff(f);
f2=diff(f,2);
inflectionpoint=solve(f2,x);
%fplot(inflectionpoint)
infx=(inflectionpoint);
humanreadableinfx=double(infx)
infy=meanbot+(meantop-meanbot)/(1+10^((meanlogic-infx)*meanhs));
humanreadableinfy=double(infy)
slopeatinfl=subs(f1,x,infx);%this line solves first derivative at inflection point at to get the slope of the tangent line
humanreadabletangentslope=double(slopeatinfl)
%(meanbot=slopeatinfl(x)-77.229135)
meanbot;
meantop;

%with current data get the value (infx,infy), if we take the 1st
%derivative of that and then plug in the x value above we get
%slopeatinfl for the slope
%of the tangent line. If we plug that back into the point slope formula:
%y-infy=slopeatinfl(x-infx) . So we get x = -2.60933 LL and x = -1.41867
%UL [old x = -2.63284 LL and x = -1.45716
%UL].
%BZKRT end comment for creating plot to estimate best limits


intarrayt; %remove semicolon (if present) to see the original answers
ABCTIC10=intarrayt(2:4:end)-intarrayt(1:4:end);%subtracts the every 4th indexes from the vehicle (ICx-vehicle) giving us ABC
ABCTIC30=intarrayt(3:4:end)-intarrayt(1:4:end);%subtracts the every 4th indexes from the vehicle (ICx-vehicle) giving us ABC
ABCTIC50=intarrayt(4:4:end)-intarrayt(1:4:end);%subtracts the every 4th indexes from the vehicle (ICx-vehicle) giving us ABC

ABCTIC10;
ABCTIC30;
ABCTIC50;
Xvalt=[1 2 3 4 5 6 7 8 9 10 11 12 13 14]; %16 18 20 22 24 26]-removed ; %these are the actual passages

%size(Xvalt,2) %this line and the next (3) are uncommented just to verify that the number of data points (passages), and defined passage numbers are the same in qty.
%size(ABCTIC30,2)
%size(ABCTIC30,2) %yay it's 20 for all
%size(ABCTIC30,2)

figure;
ax1 = subplot(4,1,1);
plot(Xvalt,ABCTIC10,'r-o');
title( 'Trametinib IC10');

ax2 = subplot(4,1,2);
plot(Xvalt,ABCTIC30,'g-o');
title( 'Trametinib IC30');

ax3 = subplot(4,1,3);
plot(Xvalt,ABCTIC50,'b-o');
title( 'Trametinib IC50');

ax4 = subplot(4,1,4);
plot(Xvalt,ABCTIC10,'r',Xvalt,ABCTIC30,'g',Xvalt,ABCTIC50,'b');
axis([ax1 ax2 ax3 ax4],[0 inf 0 75]); %this line handles definition of axes for all graphs defined in first part
title( 'Trametinib Combined');
legend('Trametinib IC10','Trametinib IC30','Trametinib IC50');
%last update 1_18_2018 sf
%next thing to do