FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get -qqy install python-pip firefox wget && \
    rm -rf /var/lib/apt/lists/*
RUN pip install selenium

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-arm7hf.tar.gz && \
    tar -xzvf geckodriver-v0.23.0-arm7hf.tar.gz && \
    mv geckodriver /usr/local/bin && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-v0.23.0-arm7hf.tar.gz

RUN groupadd -r selenium && useradd --no-log-init -r -g selenium selenium
