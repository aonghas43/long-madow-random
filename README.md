# data

## Sources

1. OpenStreetmaps
	* raw data, via export of perimter path and trees
1. Bing Maps
	* aerial data plus "pin" feature used to get positions of Commemorative oak, April 2024 mow line
1. Position of Wildflower plugs - Jon Pavey

## base data 

| Description | source | processing |
|-------------|--------|------------|
| Perimeter path | OSM export | trimmed |
| Tree locations | OSM export | added Commem. oak, location derived using Bing Maps |
| April 2024 mow line path | JonP, Bing Maps used to get positions
| Wildflower plugs zone | Jon Pavey | captured freehand using QGIS

* tree locations of interest
	* commemorative oak
  	* T17 chestnut
 	* T21 lime

## Generated data

### Dividing of meadow, based on positions of T17, T21

* line parallel with north edge of meadow
* perpendiculars through T17, T21
* perpendiculars divide meadow into 3 zones

### exclusion zones, made using buffering

* 10m zone around T17 : circular buffer
* 7m zone around T21 : circuler buffer
* 5m zone around oak : circular buffer
* path
	* path assumed to 1.5 m wide
	* exclusion zone 1m around each side of path
	* buffer 1.75 m around path centreline
* path-line of April 2024 - used to adjust bounds of perimter path
* wildflower plugs platning site, 15m buffer

### Meadow bounds available for sites

* Adjusted perimeter path (OSM less April 2024 line), convereted to area
* Exclusion zones subtracted

## Sites data

* "Random points within polygon"
	* 16 points, 9m separation
* manual adjustment to ensure minimum 3 points in each zone.

Requirement is for 3 sets of points

### Sites post-processing

* adjust system-generated "id" to be +1, since starts from 0
* add fields
	* OS_x, OS_y, populated from feature : $x, $y
	* GPS_lat, GPS_long, populated from feature, convereted to WGS84. Long=x(transform( $geometry, 'EPSG:27700', 'EPSG:4326'))
	* w3w - to be poplated manually after conveting GPS coords 
	* selected? - so printed output can be used as working document
	* comment - as for "selected?"

### QGIS items

* themes
	* sites-set-1
	* sites-set-2
	* sites-set-3

## Output

* Layout consisting of one page per set of points. Each page :
	* map, showing meadow, using theme for each set of points
	* attribute table

