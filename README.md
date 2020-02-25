# Tensorflow Docker Image

### Problems
1. The container based on this default image `tensorflow/tensorflow:2.0.1-gpu` runs as a `root`.
2. The one that comes with Jupyter notebook also runs as a `root` and only works with `http`.

### Summary
This image in this repository runs Tensorflow 2.0.1 and install Jupyter that supports https. 

- To build: `docker build . -t tf-2.0.1`
- To run: `docker run --gpus all --name tf-2.0.1 -p 8880:8888 -v notebooks:/app/tf -d -it tf-2.0.1:latest`

Once ran, docker volume `notebooks` will be mapped to the `/app/tf` directory in the image. 

Once running: 
- Login to the container: `docker exec -it tf-2.0.1 bash`
- Set up a password: `jupyter notebook password`
- Exit from container `exit`
- Restart container `docker restart tf-2.0.1`


