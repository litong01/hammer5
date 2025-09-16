
FROM mcr.microsoft.com/azure-cli:azurelinux3.0
LABEL maintainer="litong01"

RUN sed -i 's/^keepcache=.*$/keepcache=0/' /etc/tdnf/tdnf.conf
RUN tdnf update -y && tdnf install -y docker-cli sshpass bash-completion git curl
RUN tdnf install -y go kubectl helm procps-ng awk
RUN tdnf clean all
RUN mkdir -p /home/bin

COPY ./main.sh /home/bin

ENV PATH=${PATH}:/home/bin
ENV HOME=/home

WORKDIR /home
CMD [ "/home/bin/main.sh" ]
