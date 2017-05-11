#!/bin/bash

docker exec dockercomposefeatures_postgis_1 apk add -U curl unzip ca-certificates openssl
docker exec -u postgres dockercomposefeatures_postgis_1 sh /tmp/postgis/initial-data.sh 

docker exec dockercomposefeatures_geoserver_1 apk add -U curl
docker exec dockercomposefeatures_geoserver_1 sh /tmp/geoserver/initial-data.sh 
