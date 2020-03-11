# Artificial Intelligent Image Synthesizer Framework (AIISF)


## [SPADE](http://guillaumeisabelle.com/r/aif/SPADE/code)

I discovered SPADE from [Memo.TV](http://www.memo.tv/portfolio/epicganguy2019/) 
I found interesting that quote in the SPADE code : 
> To reproduce the results reported in the paper, you would need an NVIDIA DGX1 machine with 8 V100 GPUs.
>
> -- <cite>NVidia SPADE</cite>

How cost a "NVIDIA DGX1 machine with 8 V100 GPUs"?

### Installing SPADE

```sh
#Following what is in the README
git clone https://github.com/GuillaumeAI/SPADE.git
cd SPADE/

#Launch VENV of Python before installing the requirement ?
venv

pip install -r requirements.txt

```
[Torch Tutorials](https://pytorch.org/tutorials)

See in : [./x/tuto1/code.py](./x/transfer_leaning/code.py)

```log
(code.py:24171): Gdk-CRITICAL **: 19:51:27.795: gdk_cursor_new_for_display: assertion 'GDK_IS_DISPLAY (display)' failed
```
--@STCIssue Why is that? I am remote SSH #RESOLVED
```sh
export DISPLAY=:0
```

There might be further steps here : [GPU Powered DeepLearning with DVidia DIGITS](http://www.joyofdata.de/blog/gpu-powered-deeplearning-with-nvidia-digits/) ( It shows how to install CUDA and other stuff on Linux)

Downloads the Data for the tutorial.


# display: a browser-based graphics server
--@STCGoal I am getting that this will display the results in a browser we can access on the network.
--@STCIssue STATUS : Not FUNCTIONAL, some module using luarocks wont install or says they are not)


```sh
# Prereq
sudo apt install luarocks
sudo apt install torch-trepl

#install
luarocks install https://raw.githubusercontent.com/szym/display/master/display-scm-0.rockspec
```

```sh
#failed stuff
 949  sudo luarocks install https://raw.githubusercontent.com/szym/display/master/display-scm-0.rockspec
  950  th -ldisplay.start 4000
  951  th --help
  952  man th
  953  th -ldisplay.start 8000 0.0.0.0
```


