ARG APP_VERSION=1.0.0-SNAPSHOT

FROM jboss/wildfly AS goofy_as
ADD assetup /opt/jboss/wildfly/assetup/
RUN /opt/jboss/wildfly/assetup/configureAs.sh
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent

FROM goofy_as
EXPOSE 9990
ARG APP_VERSION
COPY packaging/target/packaging-${APP_VERSION}.war $JBOSS_HOME/standalone/deployments/
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
