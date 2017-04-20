
docker exec dockercomposemodis_postgis_1 apk add -U curl unzip ca-certificates openssl
docker exec -u postgres dockercomposemodis_postgis_1 dos2unix /tmp/postgis/initial-data.sh 
docker exec -u postgres dockercomposemodis_postgis_1 sh /tmp/postgis/initial-data.sh 

docker exec dockercomposemodis_geoserver_1 apk add -U curl
docker exec dockercomposemodis_geoserver_1 dos2unix /tmp/geoserver/initial-data.sh 
docker exec dockercomposemodis_geoserver_1 sh /tmp/geoserver/initial-data.sh 
