# All years for the dropdown
all_years <- sort(unique(album_data$Year))

# -----------------------------------------------------------------------------
# Behavior: Gets all albums from one year, sorted by rank (1, 2, 3...).
# Examples: year_albums(2024)
#           year_albums(2018)
# Exceptions: Empty table if no albums for that year
# Returns:  Table with Ranking, Album, Artist columns
# Parameters:
#   year.var: It is an integer. It should be a positive year (e.g. 1993, 2024)
#             that exists in the data. If the year is not in album_data, you get
#             an empty table. Run unique(album_data$Year) to see valid years.
# -----------------------------------------------------------------------------
year_albums <- function(year.var){
  year_list <- select(filter(album_data[order(album_data$Ranking),], Year == year.var), Ranking, Album, Artist)
}
