sudo apt update
sudo apt upgrade -y

sudo apt install -y x11-apps xdg-utils

sudo apt install -y gcc ocaml menhir \
  libnum-ocaml-dev libzarith-ocaml-dev libzip-ocaml-dev \
  libmenhir-ocaml-dev liblablgtk3-ocaml-dev liblablgtksourceview3-ocaml-dev \
  libocamlgraph-ocaml-dev libre-ocaml-dev libjs-of-ocaml-dev

sudo apt install -y alt-ergo wget

# Install Z3 4.8.6
wget https://github.com/Z3Prover/z3/archive/z3-4.8.6.tar.gz \
  && tar zxf z3-4.8.6.tar.gz \
	&& cd z3-z3-4.8.6; env PYTHON=python3 ./configure; cd build; make; sudo make install; \
	cd ../..; rm -r z3-*

wget http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_2.0/E.tgz \
   && tar zxf E.tgz \
   && cd E; ./configure --prefix=/usr/local; make; sudo make install; \
   cd ..; rm -r E E.tgz

wget https://gforge.inria.fr/frs/download.php/file/38367/why3-1.3.3.tar.gz \
  && tar zxf why3-1.3.3.tar.gz \
  && cd why3-1.3.3; ./configure; make ; sudo make install ; \
  why3 config --detect-provers ;\
  cd ..; yes | rm -r why3-1.3.3*

wget http://mirrors.kernel.org/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb
sudo apt install ./libffi6_3.2.1-8_amd64.deb
rm libffi6_3.2.1-8_amd64.deb

echo "deb https://dl.bintray.com/souffle-lang/deb-unstable bionic main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
sudo apt update
sudo apt install -y souffle

# Append line to .profile in order to set the X11 display
echo "" >> .profile
echo "# Set display to host" >> .profile
echo 'export DISPLAY=`who | tail -n 1 | sed -e '"'"'s/^.*(\\([^)]*\\))$/\\1/'"'"'`:0.0' >> .profile

# Append line to .profile in order to fix libGL issue on Windows
echo "" >> .profile
echo "# Fix issue with libGL on Windows" >> .profile
echo 'export LIBGL_ALWAYS_INDIRECT=1' >> .profile
