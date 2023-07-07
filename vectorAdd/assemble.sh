 "/opt/rocm-5.0.0/llvm/bin/clang-offload-bundler" -unbundle -type=a -inputs=/opt/rocm-5.0.0/llvm/bin/../lib/clang/14.0.0/lib/linux/libclang_rt.builtins-x86_64.a -targets=hip-amdgcn-amd-amdhsa-gfx900 -outputs=/tmp/libbc-clang_rt.builtins-x86_64-amdgcn-gfx900-34e892.a -allow-missing-bundles
 "/opt/rocm-5.0.0/llvm/bin/llvm-mc" -triple amdgcn-amd-amdhsa -mcpu=gfx900 -filetype=obj -o test.o test.s
 "/opt/rocm-5.0.0/llvm/bin/lld" -flavor gnu --no-undefined -shared -plugin-opt=-amdgpu-internalize-symbols -plugin-opt=mcpu=gfx900 -plugin-opt=O3 -plugin-opt=-amdgpu-early-inline-all=true -plugin-opt=-amdgpu-function-calls=false -o /tmp/vectoradd_hip-71c952/vectoradd_hip-gfx900.out test.o
 "/opt/rocm-5.0.0/llvm/bin/clang-offload-bundler" -type=o -bundle-align=4096 -targets=host-x86_64-unknown-linux,hipv4-amdgcn-amd-amdhsa--gfx900 -inputs=/dev/null,/tmp/vectoradd_hip-71c952/vectoradd_hip-gfx900.out -outputs=/tmp/vectoradd_hip-14aadd.hipfb
 "/opt/rocm-5.0.0/llvm/bin/clang-14" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -emit-obj --mrelax-relocations -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectoradd_hip.cpp -mrelocation-model static -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -debugger-tuning=gdb -v -fcoverage-compilation-dir=/home/whchung/HIP-Examples/vectorAdd -resource-dir /opt/rocm-5.0.0/llvm/lib/clang/14.0.0 -internal-isystem /opt/rocm-5.0.0/llvm/lib/clang/14.0.0/include/cuda_wrappers -internal-isystem /opt/rocm-5.0.0/include -include __clang_hip_runtime_wrapper.h -isystem /opt/rocm-5.0.0/llvm/lib/clang/14.0.0/include/.. -isystem /opt/rocm-5.0.0/hsa/include -isystem /opt/rocm-5.0.0/hip/include -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /opt/rocm-5.0.0/llvm/lib/clang/14.0.0/include -internal-isystem /usr/local/include -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../x86_64-linux-gnu/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /opt/rocm-5.0.0/llvm/lib/clang/14.0.0/include -internal-isystem /usr/local/include -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../x86_64-linux-gnu/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -O3 -std=c++11 -fdeprecated-macro -fdebug-compilation-dir=/home/whchung/HIP-Examples/vectorAdd -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcxx-exceptions -fexceptions -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -fcuda-include-gpubinary /tmp/vectoradd_hip-14aadd.hipfb -cuid=70123b4156a844c9 -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o host.o -x hip vectoradd_hip.cpp
 "/opt/rocm-5.0.0/llvm/bin/ld.lld" -z relro --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o vectoradd_hip.exe /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/7.5.0/crtbegin.o -L/opt/rocm-5.0.0/hip/lib -L/opt/rocm-5.0.0/llvm/bin/../lib/clang/14.0.0/lib/linux -L/usr/lib/gcc/x86_64-linux-gnu/7.5.0 -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/opt/rocm-5.0.0/llvm/bin/../lib -L/lib -L/usr/lib -lgcc_s -lgcc -lpthread -lm -lrt --enable-new-dtags -rpath=/opt/rocm-5.0.0/hip/lib:/opt/rocm-5.0.0/lib -lamdhip64 host.o -lclang_rt.builtins-x86_64 -lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc/x86_64-linux-gnu/7.5.0/crtend.o /usr/lib/x86_64-linux-gnu/crtn.o
