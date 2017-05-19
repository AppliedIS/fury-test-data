
docker exec fury-postgis apk add -U curl unzip ca-certificates openssl
docker exec -u postgres fury-postgis dos2unix /tmp/postgis/initial-data.sh
docker exec -u postgres fury-postgis sh /tmp/postgis/initial-data.sh

docker exec fury-geoserver apk add -U curl
docker exec fury-geoserver dos2unix /tmp/geoserver/initial-data.sh
docker exec fury-geoserver sh /tmp/geoserver/initial-data.sh 
