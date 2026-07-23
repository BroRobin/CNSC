%% Classify cells

responses=[0
3
2
0
4
2
2
0
3
0
0
3
1
3
2
2
3
2
NaN
NaN
4
2
0
2
2
2
2
4
0
2
NaN
2
NaN
4
NaN
0
1
3
NaN
2
NaN
0
0
0
0
0
NaN
0
3
4
0
2
2
NaN
0
1
NaN
NaN
0
NaN
NaN
NaN
1
NaN
NaN
0
NaN
NaN
NaN
2
2
2
NaN
4
4
];

%% Calculate stats

sum(isnan(responses)==0) % number of cells

sum(responses==0) % number of NR cells
sum(responses==1|responses==3) % number of fac
sum(responses==2) % number of sup
sum(responses==4) % number of sup delayed

sum(responses==0)/sum(isnan(responses)==0)*100 % number of NR cells
sum(responses==1|responses==3)/sum(isnan(responses)==0)*100 
sum(responses==2)/sum(isnan(responses)==0)*100 
sum(responses==4)/sum(isnan(responses)==0)*100 

%% Depth of responders per stimulus

depth=[1241
2080
2415
1250
1671
2371
2884
1241
1685
2022
2376
1165
1389
2053
2413
2853
1632
1974
2785
1066
1626
2339
1823
2352
2405
2420
2996
1885
1120
2270
1298
2350
1660
2034
2156
981
1078
1657
2220
2315
1430
1126
1506
2334
1040
1233
1740
2721
1035
1425
1612
2173
2043
1385
1682
1430
1862
1501
1080
2106
2970
1188
1759
1182
1897
2084
2395
2582
2580
2795
2932
2200
1806
2125
2500
];

depth_fac = depth(responses(:,1)==1|responses(:,1)==3);
depth_sup = depth(responses(:,1)==2);
depth_sup_delayed = depth(responses(:,1)==4);
depth_NR = depth(responses(:,1)==0);


%% Spontaneous spike rate per stimulus


spikerate=[2.08
18.48
29.25
0.37
41.92
18.03
53.31
2.93
2.00
7.01
0.53
2.40
2.69
493.39
0.99
0.29
24.99
7.493333333
0.00
0.177777778
3.55
12.72
0.19
26.00
0.64
9.79
24.88
1.33
2.67
21.60
NaN
0.16
NaN
12.53
NaN
1.44
2.64
0.11
0.48
17.63
0.00
2.16
0.05
0.88
4.08
2.45
0.08
0.24
1.49
0.24
2.19
19.89
12.51
NaN
61.11
0.00
NaN
NaN
5.96
NaN
NaN
0
0.577777778
NaN
NaN
0.222222222
NaN
NaN
NaN
1.822222222
14.48888889
2.888888889
0
5.866666667
10.17777778
];

% only one modality
spikerate_NR = spikerate(responses(:,1)==0);
spikerate_fac = spikerate(responses(:,1)==1|responses(:,1)==3);
spikerate_suppressed = spikerate(responses(:,1)==2);
spikerate_supdelayed = spikerate(responses(:,1)==4);

