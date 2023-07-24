FROM ubuntu:22.04

LABEL maintainer="ding-ze.hu@desy.de"

COPY requirements.txt requirements.txt

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        python3.11 \
        python3-pip \
        gnuplot \
        texlive-latex-extra \
	texlive-fonts-recommended \
	dvipng \
	cm-super \
        bash \
        git \
        curl \
        wget && \
    apt-get clean && \
    pip install -r requirements.txt \
        --no-cache-dir

COPY /data_pub_altenkort_2023 /data_pub_altenkort_2023

WORKDIR /data_pub_altenkort_2023

CMD ["bash", "README.sh"]
