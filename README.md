# FURY Test Data
Scripts to construct docker containers and populate with last seven days of MODIS and VIIRS data.

## Daemonize
Create daemonized instance of the PostGIS and GeoServer containers:

```docker-compose up -d```

## Initialize
Populate the PostGIS with data and GeoServer with layer exposing table on Mac / Linux:

```bash initial-data.sh```

On Windows from the cmd.exe prompt:

```initial-data.bat```


## Prosper
Go find your GeoServer at http://localhost/geoserver/
