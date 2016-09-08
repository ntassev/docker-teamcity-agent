  FROM sjoerdmulder/teamcity-agent

MAINTAINER "Nikola Tassev" <ntassev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y mercurial zip \
  python-dev libxml2-dev libxslt1-dev phantomjs stunnel4 git g++ imagemagick && \
  ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/libz.so && \
  ln -s /bin/true /usr/local/bin/growlnotify

# Check install and environment
ADD 20-setagentname.sh /etc/my_init.d/20-setagentname.sh
  
USER teamcity
WORKDIR /home/teamcity

# Install gcloud
#
RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip \
    && unzip google-cloud-sdk.zip \
    && rm google-cloud-sdk.zip \
    && HOME=/home/teamcity google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/home/teamcity/.bashrc --disable-installation-options \
    && HOME=/home/teamcity ./google-cloud-sdk/bin/gcloud components update app 
