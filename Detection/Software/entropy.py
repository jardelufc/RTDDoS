import numpy as np
import collections

sample_ips = [
    "131.084.001.031",
    "131.084.001.031",
    "131.284.001.031",
    "131.284.001.031",
    "131.284.001.000",
]

C = collections.Counter(sample_ips)
counts  = np.array(C.values(),dtype=float)
prob    = counts/counts.sum()
shannon_entropy = (-prob*np.log2(prob)).sum()
print (shannon_entropy)
