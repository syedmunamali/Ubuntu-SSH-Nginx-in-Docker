# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package lists and install Nginx
RUN apt-get update && apt-get install -y \
wget \
curl \
vim \
nano \
htop \
patch \
bash-completion \
nginx \
sudo \
openjdk-8-jdk \
openssh-server

RUN mkdir -p /var/run/sshd

RUN useradd -u 999 -rm -d /home/remote_user -s /bin/bash remote_user && \
    echo remote_user:password1234 | chpasswd

RUN usermod -aG sudo remote_user

RUN mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY id_rsa.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Copy the index.html file from the local machine to the container
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80 22

# Set the default command to run Nginx in the foreground
CMD ["/bin/bash", "-c", "service nginx start && exec /usr/sbin/sshd -D"]

# cd 
# ll .ssh/
# rm -rf .ssh/id_rsa
# rm -rf .ssh/id_rsa.pub 
# cd -
# ll
# cp -prfv id_rsa* ~/.ssh/
