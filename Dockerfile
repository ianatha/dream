FROM tleyden5iwx/caffe-gpu-master

# Download GoogLeNet
RUN /opt/caffe/scripts/download_model_binary.py /opt/caffe/models/bvlc_googlenet
