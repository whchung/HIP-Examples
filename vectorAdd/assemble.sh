 "/opt/rocm-5.4.0/llvm/bin/clang-offload-bundler" -unbundle -type=a -input=/opt/rocm-5.4.0/llvm/bin/../lib/clang/15.0.0/lib/linux/libclang_rt.builtins-x86_64.a -targets=hip-amdgcn-amd-amdhsa-gfx90a -output=/tmp/libbc-clang_rt.builtins-x86_64-amdgcn-gfx90a-97008d.a -allow-missing-bundles -hip-openmp-compatible

 "/opt/rocm-5.4.0/llvm/bin/llvm-mc" -triple amdgcn-amd-amdhsa -mcpu=gfx90a -mattr=-xnack -filetype=obj -o fused.o fused.s

 "/opt/rocm-5.4.0/llvm/bin/lld" -flavor gnu --no-undefined -shared -plugin-opt=-amdgpu-internalize-symbols -plugin-opt=mcpu=gfx90a -plugin-opt=O3 -plugin-opt=no-opaque-pointers -plugin-opt=-amdgpu-early-inline-all=true -plugin-opt=-amdgpu-function-calls=false -save-temps -o vectoradd_hip-hip-amdgcn-amd-amdhsa-gfx90a.out fused.o /tmp/libbc-clang_rt.builtins-x86_64-amdgcn-gfx90a-97008d.a

 "/opt/rocm-5.4.0/llvm/bin/clang-offload-bundler" -type=o -bundle-align=4096 -targets=host-x86_64-unknown-linux,hipv4-amdgcn-amd-amdhsa--gfx90a -input=/dev/null -input=vectoradd_hip-hip-amdgcn-amd-amdhsa-gfx90a.out -output=vectoradd_hip.cpp-hip-amdgcn-amd-amdhsa.hipfb

 "/opt/rocm-5.4.0/llvm/bin/clang-15" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -E -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectoradd_hip.cpp -mrelocation-model static -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -debugger-tuning=gdb -v -fcoverage-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -resource-dir /opt/rocm-5.4.0/llvm/lib/clang/15.0.0 -internal-isystem /opt/rocm-5.4.0/llvm/lib/clang/15.0.0/include/cuda_wrappers -idirafter /opt/rocm-5.4.0/include -include __clang_hip_runtime_wrapper.h -isystem /opt/rocm-5.4.0/llvm/lib/clang/15.0.0/include/.. -isystem /opt/rocm-5.4.0/hsa/include -isystem /opt/rocm-5.4.0/include -I /usr/include/x86_64-linux-gnu/mpich -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/backward -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9 -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/backward -internal-isystem /opt/rocm-5.4.0/llvm/lib/clang/15.0.0/include -internal-isystem /usr/local/include -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /opt/rocm-5.4.0/llvm/lib/clang/15.0.0/include -internal-isystem /usr/local/include -internal-isystem /usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -O3 -std=c++11 -fdeprecated-macro -fdebug-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -no-opaque-pointers -fcxx-exceptions -fexceptions -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=9fb63d0a63bc24ef -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o vectoradd_hip-host-x86_64-unknown-linux-gnu.cui -x hip vectoradd_hip.cpp 2>/dev/null

 "/opt/rocm-5.4.0/llvm/bin/clang-15" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -emit-llvm-bc -emit-llvm-uselists -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectoradd_hip.cpp -mrelocation-model static -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -fcoverage-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -resource-dir /opt/rocm-5.4.0/llvm/lib/clang/15.0.0 -O3 -std=c++11 -fdeprecated-macro -fdebug-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -no-opaque-pointers -fcxx-exceptions -fexceptions -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -disable-llvm-passes -fcuda-include-gpubinary vectoradd_hip.cpp-hip-amdgcn-amd-amdhsa.hipfb -cuid=9fb63d0a63bc24ef -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o vectoradd_hip-host-x86_64-unknown-linux-gnu.bc -x hip-cpp-output vectoradd_hip-host-x86_64-unknown-linux-gnu.cui 2>/dev/null

 "/opt/rocm-5.4.0/llvm/bin/clang-15" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectoradd_hip.cpp -mrelocation-model static -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -fcoverage-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -resource-dir /opt/rocm-5.4.0/llvm/lib/clang/15.0.0 -O3 -std=c++11 -fdebug-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -no-opaque-pointers -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=9fb63d0a63bc24ef -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o vectoradd_hip-host-x86_64-unknown-linux-gnu.s -x ir vectoradd_hip-host-x86_64-unknown-linux-gnu.bc 2>/dev/null

 "/opt/rocm-5.4.0/llvm/bin/clang-15" -cc1as -triple x86_64-unknown-linux-gnu -filetype obj -main-file-name vectoradd_hip.cpp -target-cpu x86-64 -fdebug-compilation-dir=/home/jack/projects/HIP-Examples/vectorAdd -dwarf-version=5 -mrelocation-model static --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o vectoradd_hip-host-x86_64-unknown-linux-gnu.o vectoradd_hip-host-x86_64-unknown-linux-gnu.s 2>/dev/null

 "/opt/rocm-5.4.0/llvm/bin/ld.lld" -z relro --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o fused.exe /lib/x86_64-linux-gnu/crt1.o /lib/x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/9/crtbegin.o -L/opt/rocm-5.4.0/lib -L/opt/rocm-5.4.0/llvm/bin/../lib/clang/15.0.0/lib/linux -L/usr/lib/gcc/x86_64-linux-gnu/9 -L/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib64 -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib64 -L/lib -L/usr/lib -lgcc_s -lgcc -lpthread -lm -lrt vectoradd_hip-host-x86_64-unknown-linux-gnu.o -rpath=/home/jack/projects/rccl/build:/opt/rocm-5.4.0/lib:/opt/rocm-5.4.0/lib -lamdhip64 -lclang_rt.builtins-x86_64 -lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc/x86_64-linux-gnu/9/crtend.o /lib/x86_64-linux-gnu/crtn.o -lmpich -lrccl
