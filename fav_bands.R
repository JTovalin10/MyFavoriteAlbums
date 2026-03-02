# -----------------------------------------------------------------------------
# Behavior: Ranks artists by average rating. You pick min albums and whether to
#           skip EPs and live albums. Returns top 15 artists.
# Examples: favorite_bands(3, TRUE)
#           favorite_bands(5, FALSE)
# Exceptions: Fewer than 15 rows if not enough artists qualify
# Returns:  Table with Artist, Rating (avg), NumAlbums; best 15 first
# Parameters:
#   min_albums.var: It is an integer. It must be at least 1. It is the minimum
#                   number of albums an artist must have to show up in the results.
#   live_ep.var:    It is a logical (TRUE or FALSE). If TRUE, EPs and live albums
#                   are excluded. If FALSE, everything is included.
# -----------------------------------------------------------------------------
favorite_bands <- function(min_albums.var, live_ep.var){

  if (live_ep.var == TRUE) {
    # Skip EPs and live albums
    album_data_checked <- select(filter(album_data, EP != "EP" & Live != "Live"), Year, Ranking, Album, Artist, Rating, Vinyl, EP, Live)
  } else {
    album_data_checked <- album_data
  }

  # Average rating per artist
  avg_per_band <- aggregate(Rating ~ Artist, album_data_checked, mean)

  # How many albums per artist
  count_per_artist <- album_data_checked %>% group_by(Artist) %>% summarize(NumAlbums = n())

  # Combine and sort by rating
  top_band_data <- merge(x = avg_per_band, y = count_per_artist, by = "Artist", all = TRUE) %>% arrange(desc(Rating))

  # Keep only artists with enough albums, take top 15
  fav_artists <- top_band_data %>% filter(NumAlbums >= as.numeric(min_albums.var)) %>% slice(1:15)
}
