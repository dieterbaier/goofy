# goofy
My Playground for developing a multi-module-maven-monolith which should be deployed onto a JBoss AS.

To not having to have a AS installed on the machine, there is a Dockerfile which will create a image with a Wildfly installed and configured for the application.

## Build the project
Just start the `mvnw[.cmd] clean install`, which does the build with the delivered maven-wrapper.

## Running the project
Run the command `docker-compose build && docker-compose up`. This will build the docker image for the goofy-application and then start three docker services:

* a H2-DB-Server,
* a Application-Server with the Camunda-WebApps installed and
* a Application-Server with the goofy-application deployed

The Camunda-WebApps as well as the goofy-application would share a BPM-Database which is located in the local-file system and managed by teh H2-DB-Server. There is another database managed by the H2-DB-Server: the application DB of the goofy-application.

The container expose the following ports on the docker-machine
* 8080 - for accessing the application (e.g. `<ip of your docker-machine>/:8080/goofy/index.xhtml`)
* 9990 - for accessing the management-console of the underlying application-server (e.g. `<ip of your docker-machine>/:9990`); login with user admin (PW: admin)
* 8081 - for accessing the camunda-webapps (e.g. `<ip of your docker-machine>/:8081/camunda`); Login with user demo (PW: demo)
* 9991 - for accessing the management-console of the underlying application-server (e.g. `<ip of your docker-machine>/:9991`); you want be able to login, since the admin-use is not configured on this machine
* 1521 - for accessing the H2-DB-Server via JDBC
*   81 - for accessing the H2-DB-User-Interface

## Docker
The project delivers a `Dockerfile`to be able to build a docker-container on your machine, if you like to run the application within a docker container (which is the prefered way).

The `Dockerfile` builds a Docker-Image with the name `brdietdidi/goofy` and starts a container with the name `goofy_runtime`. The basis for the image is the `jboss/wildfly`. If you like to modify the names, feel free to modify the `Dockerfile`.

You should start the application with `docker-compose`, since with this way, all services will be started automatically.
