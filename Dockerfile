FROM thisirs/latex-render
MAINTAINER Louis Guidez <louis@hostux.fr>

RUN echo "deb http://deb.debian.org/debian ${DEBIAN_RELEASE} non-free" > \
        /etc/apt/sources.list.d/debian-non-free.list && \
        apt-get -qq update && \
        apt-get install -y --no-install-recommends ttf-ubuntu-font-family

# Slim down image
RUN apt-get --purge -y remove tex.\*-doc$
RUN apt-get --purge -y remove texlive-fonts-extra
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
