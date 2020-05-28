FROM ubuntu:18.04
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-sqlpackage)
LABEL description="Sqlpackage 15.0.4769.1 Development Image"

ARG ACCEPT_EULA=Y

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    libunwind8 \
    libicu60 \
    wget \
    unzip \
    gnupg2 \
    libssl1.0.0 \
  && wget -O- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && wget -O- https://packages.microsoft.com/config/ubuntu/18.04/prod.list | tee /etc/apt/sources.list.d/msprod.list \
  && cat /etc/apt/sources.list.d/msprod.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    mssql-tools \
    unixodbc-dev \
    libgssapi-krb5-2 \
  && mkdir /opt/sqlpackage \
  && cd /opt/sqlpackage \
  && wget -O sqlpackage.zip https://download.microsoft.com/download/c/2/7/c27d7354-36a9-4efb-9d76-cd828eff7a2b/sqlpackage-linux-x64-en-US-15.0.4769.1.zip \
  && unzip sqlpackage.zip \
  && rm sqlpackage.zip \
  && chmod +x sqlpackage \
  && ln -s /opt/sqlpackage/sqlpackage /usr/local/bin/sqlpackage \
  && wget https://github.com/jwilder/dockerize/releases/download/v0.6.0/dockerize-linux-amd64-v0.6.0.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.6.0.tar.gz \
  && rm dockerize-linux-amd64-v0.6.0.tar.gz \
  && useradd -ms /bin/bash sprout \
  && mkdir -p /work/data && chown -R sprout:sprout /work /home/sprout \
  && rm -rf /var/lib/apt/lists/*

USER sprout
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV PATH=${PATH}:/opt/mssql-tools/bin
WORKDIR /work/data
CMD ["sqlpackage"]

