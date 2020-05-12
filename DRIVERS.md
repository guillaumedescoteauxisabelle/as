# DRIVERS

That is relevant to talk about the drivers because it took some tryout to make the NVIDIA to work

## Notes 20-05-12

* See : [GPU.md](./GPU.md) which contains notes on how to Install CUDA which partially worked (for the GPU access using the command described bellow)  

### Version of CUDA

```sh
nvcc --version

# > Gives :
# nvcc: NVIDIA (R) Cuda compiler driver
# Copyright (c) 2005-2019 NVIDIA Corporation
# Built on Wed_Oct_23_19:24:38_PDT_2019
# Cuda compilation tools, release 10.2, V10.2.89
```

### Know if GPU Works

```.bash
# Checkout Repo used is Stylegan2 : 
git clone https://github.com/GuillaumeAI/stylegan2.git 
cd stylegan2
```
```.bash
# Test
nvcc test_nvcc.cu -o test_nvcc -run
| CPU says hello.
| GPU says hello.
```
#### GPU says hello. echo was working only after the right driver was installed

### .bashrc - Config / Install
```.bash
# Install necessary variable
cat <<EOF >> ~/.bashrc
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64
export PATH=$PATH:/usr/local/cuda-10.2/bin
EOF 
```
```.bash
# Desactivate old version of nvcc
mv /usr/bin/nvcc /usr/bin/nvcc.old
```


----

# Archived Installation to review

## NVIDIA Drivers

```sh


# NVidia repo and driver install
add-apt-repository ppa:graphics-drivers
apt install nvidia-driver-440/bionic

startx

```
