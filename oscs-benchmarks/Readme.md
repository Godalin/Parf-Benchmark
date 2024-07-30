# Readme

This dataset contains benchmarks from [open-source-case-studies](https://git.frama-c.com/pub/open-source-case-studies), which is a collection of open source C codes to be used with [Frama-C](http://frama-c.com/), in particular with the Eva (Evolved Value Analysis) plug-in.

## Requirements

+ frama-c >= 27.1
+ shell: zsh/bash
+ For reproducing the experiment results, you may need `timeout` tool in the Unix environment.

## Basic Usage

This dataset includes study cases as follows:

+ `2048`
+ `chrony`
+ `debie1`
+ ...
+ `tweetnacl-usable`
+ `x509-parser`

and each study case contains a `.frama-c` subdirectory with a `run_eva_expert.sh` script. 

To analysis each study case:

+ `cd` to the `.frama-c` subdirectory of one of the case studies, such as `2048` or `debie1`.
+ Run `run_eva_expert.sh` to parse and run Eva on the predefined targets.

## For Parameter Refining

All the `run_eva_expert.sh` scripts have an uniform format and here is an example:

```shell
#!/bin/sh

# Preprocessing arguments for -cpp-extra-args
cppargs="-CC"

# General kernel parameters
## Please add kernel parameters here if necessary
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva"

# Analysis Targets: source files
target1="../2048.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval $cmd1
```

it contains several variables:

+ `cppargs`: a list of preprocessing arguments for `-cpp-extra-args`. If it is modified, the preprocessing of source files may fail.

+ `kernelparams`: a list of general kernel parameters provided by the original configuration file of the test case. If necessary, please add or delete kernel parameters here.

+ `evaparams`: a list of specific eva parameters for eva analysis. **Please add high-precision eva parameters here.**

  > For example,
  >
  > ```shell
  > evaparams="-eva -eva-slevel 100"
  > ```
  >
  > or
  >
  > ```shell
  > evaparams="-eva \
  >   -eva-domains gauges,octagon"

+ `target`: a list of source files for an analysis target.

  Some study cases contain more than 1 targets, such as `miniz` and `qlz`. Please see next Section "Notes" for more information.

## Notes

1. We remove some study cases that contain too many targets (usually they are a set of tests for many small programs). These study cases are `basic-cwe-examples`, `bench-moerman2018`, `c-testsuite`, `cerberus`, `ioccc`, `itc-benchmarks`, `mbedtls`, and `verisec`.

2. We also remove some study cases lack of necessary source files to pass preprocessing. These study cases are `libmodbus` and `polarssl`.

3. Some study cases contain more than 1 targets, and the corresponding `run_eva_expert.sh` have different formats. For example, this is the one of `qlz`:

   ```shell
   #!/bin/sh
   
   # Preprocessing arguments for -cpp-extra-args
   cppargs1=""
   cppargs2=""
   cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"
   cppargs4="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"
   
   # General kernel parameters
   ## Please add kernel parameters here if necessary
   kernelparams="-add-symbolic-path=..:. \
     -kernel-warn-key annot:missing-spec=abort \
     -kernel-warn-key typing:implicit-function-declaration=abort \
     -main eva_main"
   
   # Specific eva parameters
   ## Please add high-precision eva parameters here
   evaparams1="-eva"
   evaparams2="-eva"
   evaparams3="-eva"
   evaparams4="-eva"
   
   # Analysis Targets: source files
   target1="../compress_file.c \
     ../quicklz.c \
     fc_stubs.c"
   target2="../decompress_file.c \
     ../quicklz.c \
     fc_stubs.c"
   target3="../stream_compress.c \
     ../quicklz.c \
     fc_stubs.c"
   target4="../stream_decompress.c \
     ../quicklz.c \
     fc_stubs.c"
   
   cmd1="frama-c -cpp-extra-args=\"$cppargs1\" $kernelparams $evaparams1 $target1"
   cmd2="frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $evaparams2 $target2"
   cmd3="frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $evaparams3 $target3"
   cmd4="frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $evaparams4 $target4"
   
   eval $cmd1
   eval $cmd2
   eval $cmd3
   eval $cmd4
   ```

   Run this script and you will get eva analysis on different targets.

4. Some test cases contains general parameters such as `-warn-special-float none` `-absolute-valid-range` `-no-warn-signed-overflow` `-warn-special-float nan`, which can hide some alarms. **I manually remove these parameters but I am not sure whether it is appropriate by doing so.**

5. The analysis of `libyaml` takes much time (**more than 30 minutes**)! In fact, **we fail to obtain the analysis result of this test case**.