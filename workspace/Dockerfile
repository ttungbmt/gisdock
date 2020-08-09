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
        net-tools

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt-get install -y yarn

############################################################################
## Node / NVM:
############################################################################
#
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
    /bin/sh -c /tmp/install_gdal.sh && \
    rm -rf /tmp/install_gdal.sh \
;fi

ADD start.sh /etc/my_init.d
