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
* each set of sites to be in Spatialite database with distinctive name : _sites-1_, _sites-2_, _sites_3_...

Requirement is for 3 sets of points

### Sites post-processing

* adjust system-generated "id" to be +1, since starts from 0
* add fields
	* OS_x, OS_y, populated from feature : $x, $y
	* GPS_lat, GPS_long, populated from feature, convereted to WGS84. Long=x(transform( $geometry, 'EPSG:27700', 'EPSG:4326'))
	* w3w - to be poplated manually after conveting GPS coords 
	* selected? - so printed output can be used as working document
	* comment - as for "selected?"

* implementation of the above
	* what.3.words  - put result in csv file keyed by site id, with no header row, columns assmed to be id, w3w
	* SQL script to create table in spatialite to do all the processing
	* **spatialite** command-line script to update the table with w3w data
	* add enhanced sites data table to project, so they can be exported as a set to XLS



### QGIS items

* themes - base layers plus specific data for selected set of sites
	* sites-set-1
	* sites-set-2
	* sites-set-3
* Layout 'just-one-map' which is A4 map with legend, scalebar and north arrow.

## Output

* export spreadsheet from the (3) spatialite layers
* using the 'just-one-map' layout, generate image output of one mape page, to be included in spreadsheet
 * add image to associated spreadsheet tab
