# deeplabcut container
# based on nvci.io/nvidia/tensorflow
# This is the easier way to use gpu.
FROM nvcr.io/nvidia/tensorflow:22.02-tf2-py3

RUN DEBIAN_FRONTEND=noninteractive apt-get update -yy \ 
    && apt-get install -yy --no-install-recommends python3 python3-pip ffmpeg libsm6 libxext6 \
        && apt-get clean \
            && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir --upgrade "deeplabcut>=2.2.0.2" decorator==4.4.2 

# TODO required to fix permission errors when running the container with limited permission.
RUN chmod a+rwx -R /usr/local/lib/python3.8/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained
