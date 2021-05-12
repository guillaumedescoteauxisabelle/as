# STC

## Intentions

* Clean and usefull, unified repo 

# Inventory
## --@STCIssue Prototype Script in many locations, duplicate, not documented

* $srcroot/gix-adaptive-style-transfer/.
* $srcroot/gix-adaptive-style-transfer/bin-gpu
* $srcroot/gix-adaptive-style-transfer/bin-gpu
* $srcroot/x__etch-a-sketch__210224/gia-ast
* $libroot/results
* $libroot/samples
* $libroot/datasets
* $rwroot/
* $rwroot/tests
* $srcroot/gis-make-contact-sheet/
* $srcroot/gis-make-contact-sheet/gis-csm

### gix-adaptive-style-transfer

#### ./
Original python library from Sonoku

#### ./bin-gpu/delp2-docker
containertag guillaumeai/ast:gpu-cpu-limitation-210421
* Used for inference using the GPU infrastructured container but with CPU because the GPU on current hardware is crap.

#### ./bin-gpu
Commands for containerized commands.

* GPU Training Scripts

```sh
ds=gia-ds-wassily_kandinsky_v1_210310 #Dataset folder located in $dsroot
./run-gpu-train-bg-var2 $ds #launch background variation 2 training in a container
## container_tag="jgwill/gix-adaptive-style-transfer:gpu-var2"


./run-gpu-train-bg $ds #launch background training in a container
## container_tag=""


```

* GPU Render Scripts
* CPU Render Scripts

### $srcroot/x__etch-a-sketch__210224/gia-ast

* NodeJS Cli package
### $libroot/results

* Results related scripts

### $libroot/samples

* Samples(Content) related scripts
### $libroot/datasets

* Datasets related scripts
### $rwroot/

* Container creation and management prototypes

### $rwroot/tests

* Various looping stylization prototypes
### $srcroot/gis-make-contact-sheet/gis-csm

* ./ Contact sheet infrastructure
* ./gis-csm CS NodeJS CLI