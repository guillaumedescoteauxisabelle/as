# Machine Learning/AI Framework

## STATUS: Many Library are not loading 


----

## Python
* Python 2.7 is deprecating
* --@STCIssue Houdini has python 3.7.4
```sh
sudo apt-get update && sudo apt-get install python3

sudo apt install python3-pip

sudo apt install virtualenv

sudo pip3 install -U virtualenv  # system-wide install


```

## TensorFlow
* TensorFlow with GPU

### Locally
* Following : [tensorflow.org/install/pip](https://www.tensorflow.org/install/pip)

```sh
virtualenv --system-site-packages -p python3 ./venv

```

### Docker
```sh
# Run a TensorFlow container
 sudo docker pull tensorflow/tensorflow  # Download latest stable image
 sudo docker run -it -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter  # Start Jupyter server 
 ```














# See Also

See : [README.md](./README.md)