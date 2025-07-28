#!/bin/bash

rm tests_results.txt

echo "Tests currently executing ..."
rm tests/opencl/vecadd/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=vecadd --args=-n1048576 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Vecadd HPDC test finished"
rm tests/opencl/vecadd/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=vecadd --args=-n1048576 --perf=1 &>> tests_results.txt
echo "Vecadd test finished"

rm tests/opencl/transpose/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=transpose --args="-width=1024 -height=1024" --rebuild=1 --perf=1 &>> tests_results.txt
echo "Transpose HPDC test finished"
rm tests/opencl/transpose/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=transpose --args="-width=1024 -height=1024" --perf=1 &>> tests_results.txt
echo "Transpose test finished"

rm tests/opencl/sgemm3/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=sgemm3 --args="-n256 -t2" --rebuild=1 --perf=1 &>> tests_results.txt
echo "Sgemm3 HPDC test finished"
rm tests/opencl/sgemm3/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=sgemm3 --args="-n256 -t2" --perf=1 &>> tests_results.txt
echo "Sgemm3 test finished"

rm tests/opencl/sgemm2/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=sgemm2 --args=-n256 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Sgemm2 HPDC test finished"
rm tests/opencl/sgemm2/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=sgemm2 --args=-n256 --perf=1 &>> tests_results.txt
echo "Sgemm2 test finished"

rm tests/opencl/sgemm/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=sgemm --args=-n256 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Sgemm HPDC test finished"
rm tests/opencl/sgemm/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=sgemm --args=-n256 --perf=1 &>> tests_results.txt
echo "Sgemm test finished"

rm tests/opencl/sfilter/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=sfilter --args=-n512 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Sfilter HPDC test finished"
rm tests/opencl/sfilter/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=sfilter --args=-n512 --perf=1 &>> tests_results.txt
echo "Sfilter test finished"

rm tests/opencl/saxpy/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=saxpy --args=-n1048576 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Saxpy HPDC test finished"
rm tests/opencl/saxpy/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=saxpy --args=-n1084576 --perf=1 &>> tests_results.txt
echo "Saxpy test finished"

rm tests/opencl/psort/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=psort --args="-f -n4096" --rebuild=1 --perf=1 &>> tests_results.txt
echo "Psort HPDC test finished"
rm tests/opencl/psort/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=psort --args="-f -n4096" --perf=1 &>> tests_results.txt
echo "Psort test finished"

rm tests/opencl/guassian/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=guassian --args="-s 512" --rebuild=1 --perf=1 &>> tests_results.txt
echo "Gaussian HPDC test finished"
rm tests/opencl/guassian/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=guassian --args="-s 512" --perf=1 &>> tests_results.txt
echo "Gaussian test finished"

rm tests/opencl/conv3/current_misses_HPDC.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --hpdcache --app=conv3 --args=-n512 --rebuild=1 --perf=1 &>> tests_results.txt
echo "Conv3 HPDC test finished"
rm tests/opencl/conv3/current_misses_VX_cache.txt
./ci/blackbox.sh --driver=rtlsim --cores=1 --warps=1 --app=conv3 --args=-n512 --perf=1 &>> tests_results.txt
echo "Conv3 test finished"

echo "Execution of the tests is finished (results in txt file)."
$(shutdown -h +2)
