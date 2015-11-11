# CensusAPITools
R package containing utility functions for interacting with the Census API

This package contains three functions: createCensusURL, createCleanCensusDF and bindCensusDataToMap. 
       - createCensusURL accepts the year, variable codes, tract, county and state FIPS codes, your CensusAPI key and the level (either county or tract). It takes this information and creates the URL which the Census API accepts and produces the appropriate data for. 
       - createCleanCensusDF accepts a URL, variable names and has a logical statement 'tracts', which should be TRUE if the the level in createCensusURL was 'tract'. This parameter exists so that we can provide unique GEOIDs for every tract if data is being downloaded at the tract level, but can create shorter ones if it is only being downloaded at the county level. This is also to correlate with the unique GEOIDs used in the tigris package and datasets. 
       - bindCensusDataToMap accepts a dataframe and a spatial polygons data frame (intended to be only from tigris package and the createCleanCensusDf function, because it depends on the 'GEOID' marker) and binds the data from the dataframe to the @data slots in the spatial polygons dataframe. This creates a rich dataset that can be used to create colored maps, etc. 
