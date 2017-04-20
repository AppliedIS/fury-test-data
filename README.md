# docker-compose-modis
Scripts to construct docker containers and populate with a stream of data based on MODIS.

## Daemonize
Create daemonized instance of the PostGIS and GeoServer containers:

```docker-compose up -d```

## Initialize
Populate the PostGIS with MODIS data and GeoServer with layer exposing table on Mac / Linux:

```bash initial-modis.sh```

On Windows from the cmd.exe prompt:

```initial-modis.bat```


## Prosper
Go find your GeoServer at http://localhost:8080/geoserver/

