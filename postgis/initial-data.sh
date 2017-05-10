#!/bin/bash

retrieve (){
    # Identify shapefile with current days data
    SHAPEFILEZIP=$1
    echo $SHAPEFILEZIP

    # Grab file name only and unzip dataset
    wget $SHAPEFILEZIP
    SHAPEFILEZIP=$(basename $SHAPEFILEZIP)
    unzip $SHAPEFILEZIP
    rm $SHAPEFILEZIP

    # Strip extension off name and convert shapefile to a SQL script
    echo stripping file name to prefix
    SHAPEFILEPRE=${SHAPEFILEZIP/_shapefile/}
    SHAPEFILEPRE=`echo $SHAPEFILEPRE | cut -d "." -f 1`
    shp2pgsql -I -D -d -s 4326 $SHAPEFILEPRE.shp $2 > /tmp/tempdata.sql
    psql -f /tmp/tempdata.sql testdb
    psql testdb -c "alter table $2 add acq_datetime timestamp with time zone;"
    psql testdb -c "update $2 set acq_datetime=(acq_date || ' ' || acq_time)::timestamp;"

    # Cleanup scratch files
    rm $SHAPEFILEPRE.*
    rm /tmp/tempdata.sql
}

# Ensure we are in a location that is writable
cd /tmp

# Start  database so that we can execute the data intialization tasks
psql -c "CREATE DATABASE testdb;"
psql -c "CREATE EXTENSION postgis;" testdb
retrieve https://firms.modaps.eosdis.nasa.gov/active_fire/c6/shapes/zips/MODIS_C6_Global_7d.zip public.modis
retrieve https://firms.modaps.eosdis.nasa.gov/active_fire/viirs/shapes/zips/VNP14IMGTDL_NRT_Global_7d.zip public.viirs
