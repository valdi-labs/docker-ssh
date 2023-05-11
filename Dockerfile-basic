FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y openssh-client && \
    apt-get install -y sudo
RUN mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd
RUN useradd -m ubuntu && \
    usermod -aG sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY . .
RUN chmod 600 private-key && \
    chown ubuntu:ubuntu private-key
RUN chmod 700 start.sh && \
    chown ubuntu:ubuntu start.sh
USER ubuntu
ENTRYPOINT ["./start.sh"]