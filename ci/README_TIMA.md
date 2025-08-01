# HPDC in Vortex

HPDC has been integrated into Vortex as an available option for the L1 Dcache. It can be chosen as part of the RTL for the tests by adding the option **--hpdcache** while executing the blackbox. This git branch allow to directly download a "ready-to-go" version of Vortex with the HPDC as for **32 bits** word-length in the cache (64 possible, but performance analyzing was done on 32). For that, you need to do as said in the global README.md file (from cloning to executing the demo of blackbox) into the Docker that you have configurated. Once it is done, we can get to the different tools which allow you to evaluate misses, IPC, loads and so on:

## Before getting further; useful links

- GitHub of [HPDcache](https://github.com/openhwgroup/cv-hpdcache)
- HPDC's [UserGuide](https://openhw-group-cv-hpdcache.readthedocs-hosted.com)
- And OpenCL's API [here](https://registry.khronos.org/OpenCL/specs/3.0-unified/html/OpenCL_API.html)

Also, as it may happen depending of the successfullness of the clone, the "battery tests" file can remain unexecutable. In which case, run from the base of repository:
```sh
    cd build/ci
    chmod +x tests_battery_opencl.sh
```
**Warning :**when launched, it executes a wide variety of tests for very demanding inputs (causes millions of cycles), so launch it while keeping in mind that it wil take quite a few hours (if "too long" or if you have only the results you need in the .txt file associated, just **Ctrl+C** for inerrupting the process in the Docker).

## Misses tracking (and used bytes through coalescing)

You will find through the SystemVerilog code (in /hw/rtl folder), precisely in the "VX_hpdcache.sv" and "VX_cache.sv" files, counters for misses: writes, reads and "current misses" (which stack the number of misses at each cycle). These are saved into .txt files, that you'll notice appearing inside the folder of the tests that has been run for /build directory. Once it is the case, you can visualise the data with the python scripts "hist_misses_tracking_(HPDC/VX_cache).py" provided in /ci, depending on which cache you want to check. For that, run **in the test /build/tests/opencl/(name-of-test)/ directory** one of the following command:
```sh
    python3 ../../../ci/hist_misses_tracking_HPDC.py
    python3 ../../../ci/hist_misses_tracking_VX_cache.py
```

You will surely notice also in the comments inside "VX_mem_coalescer.sv", counters regarding the usage of bytes; they were used to confirm the validity of coalescing with HPDC. If you wish, you can use them by decommenting, which will produce after a simulation 4 graphs (bytes requested for write, bytes used for write, bytes requested for read, bytes used fo read) that you will be able to get with another python script, with the same conditions on the launching directory as for the misses above, by running:
```sh
    python3 ../../../ci/hist_bytes_coalescing.py
```

## Performance counters of VX and tests sizing

Vortex provides numerous counters in perf mode : cycles, instructions, loads, stalls. They are enbaled with the **--perf=1** when using the blacbox (enabled in battery-tests), in stdout.
For the analyses to be relevant, the tests have to be run for at least 2 million cycles. That explains why the battery of tests inside /ci was configurated that way. However, if you wish to change it, just modify the **--args** options for a given test command inside.
**Warning :** the .txt file with the performance data, if it already exists, is **removed at the start of each execution**. If you want to keep the previous one, think of copying it to a different file.

## Future work

Results have demonstrated that the performance of HPDC is only partially explained by the reduced number of cycles for load-latency. Hits have now to be tracked, by creating counters similar to what we have for thes misses and surely even adaptating the "load-latency" for instructions globally. Hits for reads and writes are confirmed by the [events](https://openhw-group-cv-hpdcache.readthedocs-hosted.com/interface.html#event-signals) signals at the output of HPDC.

Finally, CMO's and AMO's await for their activation in the RTL of the wrapper for HPDC (AMO's especially will also need new SW tests for demonstrating their relevance).
