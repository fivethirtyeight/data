#!/usr/bin/env python
import numpy as np
import pandas as pd
religions = ['Buddhist', 'Catholic', 'Evangel Prot', 'Hindu', 'Hist Black Prot', 'Jehovahs Witness', 'Jewish', 'Mainline Prot', 'Mormon', 'Muslim', 'Orthodox Christian', 'Unaffiliated']
csv = open("current.csv", 'w')
csv.truncate()

def write_row(matrix):
  arr = np.asarray(matrix[0])[0]
  row = ','.join([str(a) for a in arr]) + '\n'
  csv.write(row)

# Intitial distribution of religions in US
first = np.matrix([.007, .208, .254, .007, .065, .008, .019, .147, .016, .009, .005, .228])

# Normed to sum to 100%
current = first / np.sum(first)
t0 = current
write_row(current)

# Transition matrix 
trans = np.matrix(((0.390296314, 0.027141947, 0.06791021, 0.001857564, 0, 0, 0.011166082, 0.059762879, 0, 0, 0, 0.396569533),
                   (0.005370791, 0.593173325, 0.103151608, 0.000649759, 0.010486747, 0.005563864, 0.002041424, 0.053825329, 0.004760476, 0.001130529, 0.000884429, 0.199488989),
                   (0.00371836, 0.023900817, 0.650773331, 0.000250102, 0.016774503, 0.003098214, 0.001865491, 0.122807467, 0.004203107, 0.000186572, 0.002123778, 0.151866648),
                   (0, 0, 0.0033732, 0.804072618, 0, 0.001511151, 0, 0.01234639, 0, 0.00209748, 0, 0.17659916),
                   (0.002051357, 0.016851659, 0.09549708, 0, 0.699214315, 0.010620473, 0.000338804, 0.024372871, 0.000637016, 0.009406884, 0.000116843, 0.129892558),
                   (0, 0.023278276, 0.109573979, 0, 0.077957568, 0.336280578, 0, 0.074844833, 0.007624035, 0, 0, 0.35110361),
                   (0.006783201, 0.004082693, 0.014329604, 0, 0, 0.000610585, 0.745731278, 0.009587587, 0, 0, 0.002512334, 0.184058682),
                   (0.005770357, 0.038017215, 0.187857555, 0.000467601, 0.008144075, 0.004763516, 0.003601208, 0.451798506, 0.005753587, 0.000965543, 0.00109818, 0.25750798),
                   (0.007263135, 0.01684885, 0.06319935, 0.000248467, 0.0059394, 0, 0.001649896, 0.03464334, 0.642777489, 0.002606278, 0, 0.208904711),
                   (0, 0.005890381, 0.023573308, 0, 0.011510643, 0, 0.005518343, 0.014032084, 0, 0.772783807, 0, 0.15424369),
                   (0.004580353, 0.042045841, 0.089264134	, 0, 0.00527346, 0, 0, 0.061471387, 0.005979218, 0.009113978, 0.526728084, 0.243246723),
                   (0.006438308, 0.044866331, 0.1928814, 0.002035375, 0.04295005, 0.010833621, 0.011541439, 0.09457963, 0.01365141, 0.005884336, 0.002892072, 0.525359211)))

# Fertility array
fert = np.matrix(((2.1, 2.3, 2.3, 2.1, 2.5, 2.1, 2, 1.9, 3.4, 2.8, 2.1, 1.7)))

# Create data frame for printing later
religionDataFrame = pd.DataFrame()

for x in range(0,100):
    ### beginning of conversion step
        
    # apply transition matrix to current distribution
    current = current * trans
    
    ### beginning of fertility step
    # divide by two for couple number
    current = current/2
    
    # adjust by fertility
    current = np.multiply(fert, current)
    
    # normalize to 100%
    current = current / np.sum(current)
    write_row(current)
    
    # add to data frame
    religionDataFrame = religionDataFrame.append(pd.DataFrame(current), ignore_index=True)

csv.close()
religionDataFrame.columns = religions
religionDataFrame.to_csv("current_pandas_save.csv")
