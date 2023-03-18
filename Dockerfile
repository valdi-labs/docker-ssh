FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y openssh-client && \
    apt-get install -y sudo
RUN useradd -m valdi && \
    echo "valdi:8675309" | chpasswd && \
    usermod -aG sudo valdi
RUN mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]