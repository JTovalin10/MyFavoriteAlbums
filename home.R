# -----------------------------------------------------------------------------
# Behavior: Counts how many albums are in the data, subtracts 1 for the header.
#           Prints the number to the console. Needs album_data loaded first.
# Examples: total_album_count()
# Exceptions: Stops if album_data isn't loaded
# Returns:  Prints "Albums in the database: N"
# Parameters: none
# -----------------------------------------------------------------------------
total_album_count <- function(){
  total_albums <- nrow(album_data)
    print(paste0("Albums in the database: ", total_albums - 1))
  }

# -----------------------------------------------------------------------------
# Behavior: Counts how many different artists are in the data. Each artist
#           counted once no matter how many albums they have. Prints to console.
# Examples: total_band_count()
# Exceptions: Stops if album_data isn't loaded
# Returns:  Prints "Artists in the database: N"
# Parameters: none
# -----------------------------------------------------------------------------
total_band_count <- function(){
  total_bands<- length(unique(album_data$Artist))
    print(paste0("Artists in the database: ", total_bands))
}


# -----------------------------------------------------------------------------
# Behavior: Finds which artist has the most albums in the data. Prints their name.
# Examples: most_pop_artist()
# Exceptions: Stops if album_data isn't loaded
# Returns:  Prints "Artist with most albums in the database: X"
# Parameters: none
# -----------------------------------------------------------------------------
most_pop_artist <- function(){
    popular_artist <- tail(names(sort(table(album_data$Artist))), 1)
      print(paste0("Artist with most albums in the database: ", popular_artist))
}

