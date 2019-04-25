# Testing environment for CVE-2019-6976
This repository contains all the files and information to set up an environment with the vulnerable libvips library to play around with CVE-2019-6976. 

The main purpose of this image is to provide a testing environment for the entropy calculator Upload Scanner addon. (https://github.com/Tare05/upload-scanner/tree/entropy)

Set up
======

You can use the following docker command to pull down the docker image:

`docker pull tare05/libvipsvuln:latest` 

After the image is downloaded, start the docker container:

`docker run -p 8085:8085 tare05/libvipsvuln`

This command will start the docker container with a vulnerable python server listening on your machine at port 8085.

The container runs in a while true loop as a workaround to restart the python server if it crashes from memory corruption, so in order to shut down the container use the following command:

`docker kill <Container ID>`


File descriptions
=================

#### Dockerfile
This is the Dockerfile which was used to build the docker image.

#### reqiurements.txt
This contains all the neccessary modules for the python server on the docker container.

#### restart.sh
Creates a while loop which continuously restarts the python server whenever it crashes.

#### test.py
Code for the python server.

Build your own image
====================
To tweak around or customize the docker image simply do a git clone to this repo

``git clone https://github.com/Tare05/TestEnvForEntropyCalc``

make the neccessary changes to the Dockerfile/test.py or whatever you want, and rebuild the docker image with the following command:

``docker build --tag=<your tag> .``

and stat the newly created container.
