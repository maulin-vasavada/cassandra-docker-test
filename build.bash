#!/bin/bash

cd ..

image_name=maulin/cassandra
image_ver=v1
image_tag=$image_name:$image_ver

echo "Deleting the old image..."
docker rmi $image_tag

echo "Building the image..."
docker build --tag $image_tag .

echo "Verifying the built image..."
docker images | grep $image_name

echo "Running the container..."
# using --user arg enables us to specify running it as 'cassandra' user so that when
# we do docker exec -it we will get logged in as cassandra which will make it easy
# for accessing /etc/cassandra files since its created with cassandra:cassandra access
docker run --user cassandra --rm -p 7199:7199 -e "JMX_HOST=localhost" $image_tag

# in jConsole use the below url as remote service and use cassandra/cassandra username/password
# for the auth
# service:jmx:rmi://localhost/jndi/rmi://localhost:7199/jmxrmi
