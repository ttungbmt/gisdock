#!/usr/bin/env bash

add-apt-repository -y ppa:ubuntugis/ppa && apt-get update
apt-get install -y gdal-bin python-gdal libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install GDAL
