#' @export
#' @title Binds Census data to S4 dataframe
#' @param df a census dataframe
#' @param spdf an S4 dataframe
#' @description Binds Census data to a Spatial Polygons Dataframe from tigris package using GEOID as unique identifier.
#' @return A spatial polygons dataframe with extra columns in @@data



bindCensusDataToMap <- function(df, spdf) {
  rownames(df) <- df$GEOID
  reorderedData <- df[spdf@data$GEOID,]
  completeData <- cbind(spdf@data, reorderedData)
  spdf@data <- completeData
  return(spdf)
}

