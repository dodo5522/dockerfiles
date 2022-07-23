FROM amazon/aws-cli:2.7.18
MAINTAINER Takashi Ando <dodo5522@gmail.com>

# Install dependencies
RUN yum update && yum install -y crontabs

# Add the script to the Docker Image
ADD cronjob.sh /root/cronjob.sh
RUN chmod 0644 /root/cronjob.sh

# Add the cron job
RUN crontab -l | { cat; echo "0 0 * * * bash /root/cronjob.sh"; } | crontab -

# Run the command on container startup
ENTRYPOINT ["crond", "-n"]

