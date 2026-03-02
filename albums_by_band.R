# All artists in A-Z order for the dropdown
all_bands <- sort(unique(album_data$Artist))

# -----------------------------------------------------------------------------
# Behavior: Gets all albums by the artist you pick. Shows album name, year,
#           and rating. Sorted by year (oldest first). Artist name is case-sensitive.
# Examples: albums_by_bands("Radiohead")
#           albums_by_bands("Taylor Swift")
# Exceptions: Empty table if artist not found
# Returns:  Table with Album, Year, Rating columns
# Parameters:
#   band.var: Character. Artist name; must match album_data$Artist exactly.
#             Case-sensitive. Run unique(album_data$Artist) for valid names.
# -----------------------------------------------------------------------------
albums_by_bands <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
}

# -----------------------------------------------------------------------------
# Behavior: Averages the rating for all of an artist's albums. Prints it to
#           the console with 2 decimal places.
# Examples: band_mean_rating("Radiohead")
#           band_mean_rating("Arcade Fire")
# Exceptions: Returns NA if artist has no albums
# Returns:  Prints "Average Rating: X.XX"
# Parameters:
#   band.var: Character. Artist name; case-sensitive. Same as albums_by_bands.
# -----------------------------------------------------------------------------
band_mean_rating <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  avg_rating <- mean(band_albums$Rating)
  print(paste0("Average Rating: ", format(round(avg_rating, 2), nsmall =2)))
}

# -----------------------------------------------------------------------------
# Behavior: Counts how many albums an artist has in the data. Prints to console.
# Examples: band_album_count("Radiohead")
#           band_album_count("The Smile")
# Exceptions: 0 if artist not found
# Returns:  Prints "Number of Albums Ranked: N"
# Parameters:
#   band.var: Character. Artist name; case-sensitive. Same as albums_by_bands.
# -----------------------------------------------------------------------------
band_album_count <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  band_count <-count(band_albums)
  print(paste0("Number of Albums Ranked: ", band_count))
}




