CREATE TABLE sites(
    id integer not null primary key AUTOINCREMENT,
    OS_x double,
    OS_y double,
    GPS_lat double,
    GPS_long double
);
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
GPS_long=x(ST_Transform(geometry, 4326))
END

-- 'sites-input' created by QGIS as set of random points
INSERT into sites(geometry)
SELECT geometry from site_input;

