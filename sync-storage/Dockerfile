FROM amazon/aws-cli:2.7.18
MAINTAINER Takashi Ando <dodo5522@gmail.com>

WORKDIR /root

# Install dependencies
RUN yum update && yum install -y crontabs glibc-langpack-ja

# Set locale and timezone
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Add the script to the Docker Image
ADD entry-point.sh /root/entry-point.sh
RUN chmod +rx /root/entry-point.sh

# Run the command on container startup
ENTRYPOINT ["/root/entry-point.sh"]

