FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y x11-apps xdg-utils

RUN apt-get install -y gcc ocaml menhir \
	libnum-ocaml-dev libzarith-ocaml-dev libzip-ocaml-dev \
	libmenhir-ocaml-dev liblablgtk3-ocaml-dev liblablgtksourceview3-ocaml-dev \
	libocamlgraph-ocaml-dev libre-ocaml-dev libjs-of-ocaml-dev

RUN apt-get install -y alt-ergo wget

# Install Z3 4.8.6
RUN wget https://github.com/Z3Prover/z3/archive/z3-4.8.6.tar.gz \
	&& tar zxf z3-4.8.6.tar.gz \
	&& cd z3-z3-4.8.6; env PYTHON=python3 ./configure; cd build; make; make install; \
	cd ../..; rm -r z3-*

RUN wget http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_2.0/E.tgz \
	 && tar zxf E.tgz \
	 && cd E; ./configure --prefix=/usr/local; make; make install; \
	 cd ..; rm -r E E.tgz

RUN wget https://gforge.inria.fr/frs/download.php/file/38367/why3-1.3.3.tar.gz \
	&& tar zxf why3-1.3.3.tar.gz \
	&& cd why3-1.3.3; ./configure; make ; make install ;\
	why3 config --detect-provers ;\
	cd ..; yes | rm -r why3-1.3.3*

RUN wget http://mirrors.kernel.org/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb
RUN apt-get install ./libffi6_3.2.1-8_amd64.deb
RUN rm libffi6_3.2.1-8_amd64.deb

RUN echo "deb https://dl.bintray.com/souffle-lang/deb-unstable bionic main" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
RUN apt-get update
RUN apt-get install -y souffle

RUN # Append line to .profile in order to fix libGL issue on Windows
RUN echo "" >> /root/.profile
RUN echo "# Fix issue with libGL on Windows" >> /root/.profile
RUN echo 'export LIBGL_ALWAYS_INDIRECT=1' >> /root/.profile
