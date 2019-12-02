# proj-datumgrid-nz

## About the proj-datumgrid-nz PROJ resource package

The proj-datumgrid-nz resource package is a collections of grids
required for coordinate transformations between New Zealand geographic 
and vertical coordinate systems using the [PROJ] software and coordinate
conversion libraries.

(Note: the NZGD49-NZGD2000 NTv2 grid nzgd2kgrid0005.gsb is currently
also included in the default proj-datumgrid resource).

All resources included in proj-datumgrid-nz are sourced from
[Land Information New Zealand].

## Licence

The contents of proj-datumgrid are released subject to the
[Creative Commons Attribution 4.0 International licence].


## Installation

The files in this package can be unpacked in the PROJ data directory.
For an installed PROJ this may be /usr/local/share/proj or /usr/share/proj
on unix style operating systems.

Alternatively the files can be unloaded into a user directory. Use the environment 
variable PROJ_LIB to identify this directory.  In Windows this can be done using
something like:

    SET PROJ_LIB=C:\myprojdirectory

and on unix style operating systems with

    export PROJ_LIB=/myhome/myprojdirectory

## Included grids

### NZGD1949 to NZGD2000 transformation 

*Filename*: nzgd2kgrid0005.gsb
*Reference*: https://www.linz.govt.nz/data/geodetic-system/coordinate-conversion/geodetic-datum-conversions/nzgd1949-nzgd2000

Distortion grid to convert New Zealand Geodetic Datum 1949 longitude and latitude 
to New Zealand Geodetic Datum 2000 longitude and latitude. 

#### Usage

Conversion from NZGD1949 to NZGD2000 using proj strings
  
  echo '173 -41 0' | cs2cs -v -f %.8f +proj=longlat +ellps=intl +datum=nzgd49 +nadgrids=nzgd2kgrid0005.gsb +to +proj=longlat +ellps=GRS80 +towgs84=0,0,0 

Conversion from NZGD1949 to NZGD2000 using EPSG codes (proj 6.2+).  Note that this uses 
EPSG specified coordinate order for coordinate systems (latitude/longitude in this case).

  echo '-41 173 0' | cs2cs -f %.8f EPSG:4272 EPSG:4167

### Quasigeoid grids

Two geoid grid files are included:

*Geoid*: New Zealand Quasigeoid 2009
*Filename*: nzgeoid2009.gtx
*Reference*: https://www.linz.govt.nz/data/geodetic-system/datums-projections-and-heights/vertical-datums/new-zealand-quasigeoid-2009-nzgeoid2009

*Geoid*: New Zealand Quasigeoid 2016
*Filename*: nzgeoid2016.gtx
*Reference*: https://www.linz.govt.nz/data/geodetic-system/datums-projections-and-heights/vertical-datums/new-zealand-quasigeoid-2016-nzgeoid2016

These grids define the height of the New Zealand Quasigeoid relative to the ellipsoidal height surface on which NZGD2000 is based (nominally a GRS80 ellipsoid aligned ITRF96 at epoch 2000.0). See https://www.linz.govt.nz/nzgd2000 for more information on the NZGD2000 datum.  
The current NZGD2000 deformation model has this as the zero elevation of NZGD2000 coordinates
at the current epoch.  

These quasigeoids are the reference surfaces the New Zealand Vertical Datum 2009 (NZVD2009) and New Zealand Vertical Datum 2016 (NZVD2016).  

#### Usage

To convert a NZGD2000 ellipsoidal height 100.0 to a NZVD2016 height at 173W 41S

   echo '173 -41 100.0' | cs2cs -v -f %.8f +proj=longlat +ellps=GRS80 +to +proj=longlat +ellps=GRS80 +geoidgrids=nzgeoid2016.gtx

To convert a NZVD2016 ellipsoidal height to a NZGD2000 ellipsoidal height

   echo '173 -41 100.0' | cs2cs -v -f %.8f +proj=longlat +ellps=GRS80 +geoidgrids=nzgeoid2016.gtx +to +proj=longlat +ellps=GRS80

To convert a NZGD2000 ellipsoidal height 100.0 to a NZVD2016 height at 173W 41S using EPSG codes (requires proj > 6.2)

   echo '-41 173 100.0' | cs2cs -f %.8f EPSG:4167 EPSG:4167+7839


### Local vertical datum transformation grids

Thirteen grids are provided to transform heights between NZVD2016 and the local vertical datums.  

These grids represent the systematic errors in the local vertical datums. 
The local vertical datums are each based on levelling from a tide gauge.  The include systematic errors from the levelling as well as a potential of the local tidal signal at the port from the global mean gravitational equipotential surface.  The NZVD2016 datum is based on gravity measurements from a national airborne gravity program and is much less prone to 
regional systematic errors.  The transformation grids are derived from comparing the benchmark heights at which both levelling data and GNSS (Global Navigation Satellite system) data are available.  

The height determined from the grid model is added to an NZVD2016 height to obtain
the corresponding local vertical datum shift.

The following grids are available:

*Local vertical datum*: Auckland 1946
*Filename*: auckht1946-nzvd2016.gtx

*Local vertical datum*: Bluff 1955
*Filename*: blufht1955-nzvd2016.gtx

*Local vertical datum*: Dunedin 1958
*Filename*: duneht1958-nzvd2016.gtx

*Local vertical datum*: Dunedin-Bluff 1960
*Filename*: dublht1960-nzvd2016.gtx

*Local vertical datum*: Gisborne 1926
*Filename*: gisbht1926-nzvd2016.gtx

*Local vertical datum*: Lyttelton 1937
*Filename*: lyttht1937-nzvd2016.gtx

*Local vertical datum*: Moturiki 1953
*Filename*: motuht1953-nzvd2016.gtx

*Local vertical datum*: Napier 1962
*Filename*: napiht1962-nzvd2016.gtx

*Local vertical datum*: Nelson 1955
*Filename*: nelsht1955-nzvd2016.gtx

*Local vertical datum*: One Tree Point 1964
*Filename*: ontpht1964-nzvd2016.gtx

*Local vertical datum*: Stewart Island 1977
*Filename*: stisht1977-nzvd2016.gtx

*Local vertical datum*: Taranaki 1970
*Filename*: taraht1970-nzvd2016.gtx

*Local vertical datum*: Wellington 1953
*Filename*: wellht1953-nzvd2016.gtx

*Reference*: https://www.linz.govt.nz/data/geodetic-system/datums-projections-and-heights/vertical-datums/vertical-datum-relationship-grids

#### Usage

PROJ versions prior to 6.0 do not support vertical grid shifts.  However this may be 
emulated using the +geoidgrids, which subtracts the height offset defined in the grid
from height (rather than adding it for a vertical grid shift offset).  So the conversions
can be treated as geoid grids converting from the local vertical datum to NZGD2000.

To convert from a local vertical datum height to a NZVD2016 height.

   echo '175 -37 0' | cs2cs -v -f %.8f +proj=latlong +ellps=GRS80 +to +proj=latlong +ellps=GRS80 +geoidgrids=auckht1946-nzvd2016.gtx

To convert from a NZVD2016 height to a local vertical datum height.

   echo '175 -37 0' | cs2cs -v -f %.8f +proj=latlong +ellps=GRS80 +geoidgrids=auckht1946-nzvd2016.gtx +to +proj=latlong +ellps=GRS80 

[PROJ]: https://proj.org
[Land Information New Zealand]: https://www.linz.govt.nz
[Creative Commons Attribution 4.0 International licence]: https://data.linz.govt.nz/license/attribution-4-0-international/
