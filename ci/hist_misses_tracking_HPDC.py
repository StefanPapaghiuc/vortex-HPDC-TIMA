import matplotlib.pyplot as plt
import numpy as np
import collections
import matplotlib

f1 = np.loadtxt('write_misses_HPDC.txt', unpack='False')
f2 = np.loadtxt('read_misses_HPDC.txt', unpack='False')
f3 = np.loadtxt('current_misses_HPDC.txt', unpack='False')

print("Total read misse :",f1[-2])
print("Total write misses :",f2[-2])
print("Max misses in flight :",f3[0:].max())

fig, ax = plt.subplots()
bins = 10

ax.hist(f3[0:], histtype='bar', bins = bins, log = True)
ax.set_xlabel('Number of misses (per cycle)')
ax.set_ylabel('Number of cycles')
ax.set_title('Distribution of the number of misses per cycle (HPDC)')

fig.tight_layout()
plt.show()
