FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y openssh-server openssh-client sudo bash-completion vim nano curl wget git iputils-ping tmux && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd
RUN useradd -m ubuntu && \
    usermod -aG sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo ". /etc/profile.d/bash_completion.sh" >> /home/ubuntu/.profile && \
    echo "alias ll='ls -la'" >> /home/ubuntu/.profile && \
    echo "export EDITOR=vim" >> /home/ubuntu/.profile && \
    echo "export VISUAL=vim" >> /home/ubuntu/.profile && \
    chown ubuntu:ubuntu /home/ubuntu/.profile
COPY motd /etc/motd
RUN chmod 644 /etc/motd
COPY private-key start.sh ./
RUN chmod 600 private-key && \
    chown ubuntu:ubuntu private-key
RUN chmod 700 start.sh && \
    chown ubuntu:ubuntu start.sh
USER ubuntu
ENTRYPOINT ["./start.sh"]