%% Classify cells

responses=[0
0
0
0
2
0
0
0
1
0
1
2
0
3
3
1
3
0
1
3
2
0
1
3
2
3
2
0
1
0
0
3
2
1
1
1
1
1
3
1
1
3
2
1
0
2
1
3
2
0
1
0
1
1
3
1
0
1
2
1
];

%% Calculate stats

sum(isnan(responses)==0) % number of cells

sum(responses==0) % number of NR cells
sum(responses==1) % number of fac
sum(responses==2) % number of sup
sum(responses==3) % number of delayed fac

sum(responses==0)/sum(isnan(responses)==0)*100 % number of NR cells
sum(responses==1)/sum(isnan(responses)==0)*100 
sum(responses==2)/sum(isnan(responses)==0)*100 
sum(responses==3)/sum(isnan(responses)==0)*100 

%% Depth of responders per stimulus

depth=[1420
2303
1524
2150
2825
3548
1472
1988
1904
1620
1847
1396
1810
1964
1736
1833
1086
1757
1893
1980
2690
1079
2423
2645
1970
2067
2628
2813
1960
2390
2940
1013
1891
2118
1933
2037
2142
2237
1147
2275
3008
2258
3133
2381
3007
2790
2681
2698
2290
2080
2705
1950
1966
2076
1905
3005
1898
2205
2271
3003
];

depth_fac = depth(responses(:,1)==1);
depth_sup = depth(responses(:,1)==2);
depth_fac_delayed = depth(responses(:,1)==3);
depth_NR = depth(responses(:,1)==0);

%% Spontaneous spike rate per stimulus


spikerate=[3.63
7.17
1.57
5.68
0.89
0.00
0.44
8.49
2.58
0.22
0.00
6.49
5.82
0.13
0.40
12.89
1.16
0.00
6.58
0.04
42.27
1.24
0.62
0.53
0.62
1.73
1.60
0.04
4.18
0.00
2.89
3.02
1.91
11.69
12.09
5.16
0.13
0.67
4.09
0.03
10.56
0.03
6.48
0.49
6.80
9.29
11.87
3.23
24.88
0.08
0.49
0.09
6.99
0.18
0.00
0.00
1.07
7.22
16.56
11.48
];

% only one modality
spikerate_NR = spikerate(responses(:,1)==0);
spikerate_fac = spikerate(responses(:,1)==1);
spikerate_suppressed = spikerate(responses(:,1)==2);
spikerate_facdelayed = spikerate(responses(:,1)==3);

