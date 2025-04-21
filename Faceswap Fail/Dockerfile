FROM ubuntu:latest

# To disable tzdata and others from asking for input
ENV DEBIAN_FRONTEND noninteractive
ENV FACESWAP_BACKEND cpu
ENV VENV_PATH /opt/venv

RUN apt-get update -qq -y
RUN apt-get upgrade -y
RUN apt-get install -y libgl1 libglib2.0-0 python3 python3-pip python3-tk python3-venv git

RUN ln -s $(which python3) /usr/local/bin/python

RUN git clone --depth 1 --no-single-branch https://github.com/deepfakes/faceswap.git

# 创建虚拟环境（必须在同一RUN指令中完成）
RUN python3 -m venv $VENV_PATH && \
    . $VENV_PATH/bin/activate && \
    cd faceswap && \
    python -m pip install --upgrade pip && \
    python -m pip --no-cache-dir install -r requirements/requirements_cpu.txt

WORKDIR "/faceswap"

ENV PATH="$VENV_PATH/bin:$PATH"
# RUN python -m pip install  --upgrade pip --user --break-system-packages
# RUN python -m pip --no-cache-dir install -r ./requirements/requirements_cpu.txt

CMD ["/bin/bash"]