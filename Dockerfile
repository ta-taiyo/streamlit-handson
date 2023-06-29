FROM ubuntu:latest
RUN apt update && apt install -y \
        sudo \
        wget \
        vim \
WORKDIR /opt
# RUN wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
#ここからAnacondaのインストールをdocker上で試していく
# sh -x でどういったオプションあるか確認できる。（今回は -b でバッチモード、-p で個別のディレクトリにインストできる）
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh && \
        sh Anaconda3-2023.03-1-Linux-x86_64.sh -b -p /opt/anaconda3 && \
        rm -f Anaconda3-2022.05-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip
RUN pip install streamlit
EXPOSE 8501
WORKDIR /
# ENTRYPOINT ["streamlit", "run"]