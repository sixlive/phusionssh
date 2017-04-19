FROM phusion/baseimage:latest

MAINTAINER TJ Miller <tj@tjmiller.co>

ADD ssh/id_rsa /tmp/id_rsa
ADD ssh/id_rsa.pub /tmp/id_rsa.pub
ADD ssh/ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key
ADD ssh/ssh_host_dsa_key.pub /etc/ssh/ssh_host_dsa_key.pub
ADD ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key
ADD ssh/ssh_host_ecdsa_key.pub /etc/ssh/ssh_host_ecdsa_key.pub
ADD ssh/ssh_host_ed25519_key /etc/ssh/ssh_host_ed25519_key
ADD ssh/ssh_host_ed25519_key.pub /etc/ssh/ssh_host_ed25519_key.pub
ADD ssh/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
ADD ssh/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub

RUN chmod 600 /etc/ssh/ssh_host*


RUN rm -f /etc/service/sshd/down && \
    cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys \
        && cat /tmp/id_rsa.pub >> /root/.ssh/id_rsa.pub \
        && cat /tmp/id_rsa >> /root/.ssh/id_rsa \
        && rm -f /tmp/id_rsa* \
        && chmod 644 /root/.ssh/authorized_keys /root/.ssh/id_rsa.pub \
    && chmod 400 /root/.ssh/id_rsa

RUN sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config

CMD ["/sbin/my_init"]
