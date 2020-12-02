FROM ubuntu:20.04
LABEL maintainer="Joel Luth (joel.luth@gmail.com)"
LABEL description="build environment for the Korg logue SDK"

ENV LOGUE_REPO https://github.com/letrout/logue-sdk.git

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		git \
		make \
		tar \
		unzip \
		vim \
		zip \
	&& apt-get clean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /git
RUN git clone ${LOGUE_REPO}
WORKDIR /git/logue-sdk
RUN git checkout linux64
RUN git submodule update --init
WORKDIR /git/logue-sdk/tools/gcc
RUN ./get_gcc_linux.sh
#WORKDIR /git/korginc/logue-sdk/tools/logue-cli
#RUN ./get_logue_cli_linux.sh
