DROP table sites;
CREATE TABLE sites(
    id integer not null primary key,
    OS_x double,
    OS_y double,
    GPS_lat double,
    GPS_long double,
    w3w text);
SELECT
 AddGeometryColumn
 (
  -- the table-name
  'sites',
  -- the geometry column-name
  'geometry',
  -- the SRID to be used
  27700,
  -- the geometry class
  'POINT',
  -- the geometry dimension (simple 2D)
  'XY'
 );

CREATE TRIGGER sites_coordinate AFTER INSERT on sites
BEGIN
UPDATE sites 
SET OS_x=x(geometry), 
OS_y=y(geometry),
GPS_Lat=y(ST_Transform(geometry, 4326)),
GPS_long=x(ST_Transform(geometry, 4326));
END;

-- 'sites-input' created by QGIS as set of random points
UPDATE 'sites-input' set id = id + 1;
INSERT into sites(id,geometry)
SELECT id,geom from 'sites-input';

