# goofy
My Playground for developing a multi-module-maven-monolith which should be deployed onto a JBoss AS.

To not having to have a AS installed on the machine, there is a Dockerfile which will create a image with a Wildfly installed and configured for the application.

## Build the project
Just start the `mvnw[.cmd] clean install`, which does the build with the delivered maven-wrapper.

>NOTE:
>
>If just want to run the application, you don't have to build it first! Just do what is described in the section _Running the project_.

## Running the project
Just start the deliverd `deployAndStartApplication.sh', which does the following:
* Building the project with maven (clean, install)
* Stopping a possibly running docker container with the name `goofy_runtime`
* Building a new docker container with the name `goofy_runtime`
* Starting the new docker container with the name `goofy_runtime`

The container exposes two ports
* 8080 - for accessing the application (e.g. `<ip of your docker-machine>/:8080/goofy/index.xhtml`)
* 9990 - for accessing the management-console of the underlying application-server (e.g. `<ip of your docker-machine>/:9990`) 

To login to the AS-management-console use the userid `admin` with the password `admin`.

>NOTE:
>
>You can deploy the application to any application server to which you can deploy a `.war`-File.
>
>But please make sure, your application server is configured with the things you can find within the file `assetup/commands.cli`.
>
>You can try to configure your application server with the script `assetup/configureAs.sh` but you will probably have to modify the script to your dependencies.
>
>**Both files are designed four configuring a JBoss Wildfly Application-Server! But the `assetup/commands.cli` could give you a hint, what ressources the application needs to have configured within the application server**

## Docker
The project delivers a `Dockerfile`to be able to build a docker-container on your machine, if you like to run the application within a docker container (which is the prefered way).

The `Dockerfile` builds a Docker-Image with the name `goofy` and starts a container with the name `goofy_runtime`. The basis for the image is the `jboss/wildfly`. If you like to modify the names, feel free to modify the `Dockerfile`.
