FROM progrium/busybox
MAINTAINER Markus Dulghier <markus@dulghier.com>

ADD https://github.com/hashicorp/consul-template/releases/download/v0.6.0/consul-template_0.6.0_linux_amd64.tar.gz /tmp/consul-template.tar.gz
RUN cd /tmp && gunzip -c /tmp/consul-template.tar.gz | tar -xf - && mv /tmp/consul-template_0.6.0_linux_amd64/consul-template /bin/consul-template && chmod +x /bin/consul-template && rm /tmp/consul-template.tar.gz

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.4.1 /bin/docker
RUN chmod +x /bin/docker

ENTRYPOINT ["/bin/consul-template"]
CMD []
