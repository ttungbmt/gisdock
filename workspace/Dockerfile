FROM ttungbmt/laradock-workspace:latest

MAINTAINER Truong Thanh Tung <ttungbmt@gmail.com>

## Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    # Tools
    && apt-get install -y --no-install-recommends \
        sudo \
        dos2unix \
        supervisor \
        netcat \
        net-tools

###########################################################################
# Postgres
###########################################################################
USER root

ARG INSTALL_PG_CLIENT=true

RUN if [ ${INSTALL_PG_CLIENT} = true ]; then \
    # Install the pgsql client
    apt-get purge -y postgresql* \
    && apt-get update \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list \
    && apt-get update && apt-get -y upgrade \
    && apt-get install -y postgresql \
    && pg_ctlcluster 12 main start \
;fi

###########################################################################
## Node:
###########################################################################

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt-get install -y yarn

RUN yarn global add \
        # CLI
        create-react-app create-react-library react-native-cli @vue/cli @vue/cli-service-global express-generator @ionic/cli @adonisjs/cli \
        # Bundler
        lerna rollup webpack \
        # Library
        cross-env rimraf npm-run-all tailwindcss serve \
        # Other
       pm2

###########################################################################
# GDAL
###########################################################################

ARG INSTALL_GDAL=false

COPY ./scripts/install_gdal.sh /tmp/install_gdal.sh

RUN if [ ${INSTALL_GDAL} = true ]; then \
    chmod +x /tmp/install_gdal.sh && \
    dos2unix /tmp/install_gdal.sh && \
    /bin/sh -c /tmp/install_gdal.sh && \
    rm -rf /tmp/install_gdal.sh \
;fi


ADD start.sh /etc/my_init.d
RUN dos2unix /etc/my_init.d/start.sh
