FROM kartoza/geoserver:latest

MAINTAINER Truong Thanh Tung <ttungbmt@gmail.com>

# https://build.geoserver.org/geoserver/2.17.x/

ENV \
  GEOSERVER_DIR=${CATALINA_HOME}/webapps/geoserver\
  GEOSERVER_ADMIN_USER=admin \
  GEOSERVER_ADMIN_PASSWORD=geoserver \
  SAMPLE_DATA=false \
  STABLE_EXTENSIONS=charts-plugin,css-plugin,mbstyle-plugin,printing-plugin,ysld-plugin,querylayer-plugin,importer-plugin,web-resource-plugin,excel-plugin,ogr-wfs-plugin,ogr-wps-plugin

ADD conf/web.custom.xml ${GEOSERVER_DIR}/WEB-INF/web.xml

#RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php/7.1/cli/php.ini
#RUN sed -i -e "s/pid =.*/pid = \/var\/run\/php7.1-fpm.pid/" /etc/php/7.1/fpm/php-fpm.conf

EXPOSE 8080


