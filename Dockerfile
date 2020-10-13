# https://github.com/arpitpatel1501/bert-sentiment
# docker build -f Dockerfile -t docker_test .
# docker run -t docker_test

FROM ubuntu:18.04
#FROM nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04
#ENV PATH="/root/miniconda3/bin:${PATH}"
#ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update \
    && apt install -y htop python3 python3-dev wget

RUN apt install -y python3-pip

#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#    && mkdir root/.conda \
#    && sh Miniconda3-latest-Linux-x86_64.sh -b \
#    && rm -f Miniconda3-latest-Linux-x86_64.sh

#RUN conda create -y -n ml python=3.7

RUN mkdir src

COPY . src/
#RUN /bin/bash -c "cd src \
#    && source activate ml \
#    && pip install -r requirements.txt"

RUN cd src \
    && pip3 install -r requirements.txt
    

ENTRYPOINT ["python3 /src/app.py"]

#CMD ["/src/app.py"]
