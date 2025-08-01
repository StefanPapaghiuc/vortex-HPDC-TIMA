import matplotlib.pyplot as plt
import numpy as np
import collections
import matplotlib

f1 = np.loadtxt('list_of_bytes_per_req_read.txt', unpack='False')
f2 = np.loadtxt('list_of_bytes_used_read.txt', unpack='False')
f3 = np.loadtxt('list_of_bytes_per_req_write.txt', unpack='False')
f4 = np.loadtxt('list_of_bytes_used_write.txt', unpack='False')

counter_read = collections.Counter(f2)
counter_write = collections.Counter(f4)
print(counter_read)
print(counter_write)

fig, ((ax0, ax1), (ax2, ax3)) = plt.subplots(nrows=2, ncols=2)
bins = 17

ax0.hist(f1, histtype='bar', bins = bins)
ax0.set_xlabel('Number of requested bytes (read)')
ax0.set_ylabel('Number of requests')
ax0.set_title('Distribution of requests by the size of bytes (read)')

ax1.hist(f2, histtype='bar', bins = bins)
ax1.set_xlabel('Number of used bytes (read)')
ax1.set_ylabel('Number of valid outputs')
ax1.set_title('Distribution of used bytes by valid outputs (read)')

ax2.hist(f3, histtype='bar', bins = bins)
ax2.set_xlabel('Number of requested bytes (write)')
ax2.set_ylabel('Number of requests')
ax2.set_title('Distribution of requests by the size of bytes (write)')

ax3.hist(f4, histtype='bar', bins = bins)
ax3.set_xlabel('Number of used bytes (write)')
ax3.set_ylabel('Number of valid outputs')
ax3.set_title('Distribution of used bytes by valid outputs (write)')

fig.tight_layout()
plt.show()
