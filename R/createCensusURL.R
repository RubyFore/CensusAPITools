#' @export
#' @title Create and API call URL
#' @param year must be 1990, 2000 of 2010
#' @param vars a string or vector of strings specifying which variables to download. Must be the exact variable codes.
#' @param tract a string or vector of strings specifying for which tracts to download data. Must be exact FIPS code.
#' @param county a string or vector of strings specifying for which counties to download data. Must be exact FIPS code
#' @param state FIPS code or vector of FIPS codes specifying for which states to download data.
#' @param level can be either 'county' or 'tract', specifying at which geographic level to download data
#' @param key your personal API key
#' @description creates the URL with which to query the Census API for the specified variables and geographic levels. Only functional for the decennial censuses.
#' @return a string


createCensusURL <- function(year, vars, tract='all', county='all', state='all', level='county', key) {

  query_url <- ''
  varstring <- stringr::str_c(vars, collapse=',')

  # Convert tract to API characters
  if (tract == 'all') {
    tract <- '*'
  } else {
    tract <- stringr::str_c(tract, collapse=',')
  }

  # Convert county to API characters
  if (county == 'all') {
    county <- '*'
  } else {
    county <- stringr::str_c(county, collapse=',')
  }

  # Convert state to API characters
  if (state == 'all') {
    state <- '*'
  } else {
    state <- state
  }

  query_url <- paste0('http://api.census.gov/data/', year, '/sf1?get=', varstring, '&for=',
                      level, '&in=state:', state, '&in=county:', county, '&key=', key)

  return(query_url)

}
